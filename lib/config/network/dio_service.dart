// lib/services/dio_service.dart
// ignore_for_file: avoid_annotating_with_dynamic

import 'dart:async';
import 'package:bai_serve_customer/config/route/app_router.dart';
import 'package:bai_serve_customer/config/storage/storage_service.dart';
import 'package:bai_serve_customer/features/auth/cubit/auth_cubit.dart';
import 'package:bai_serve_customer/utils/log/app_log.dart';
import 'package:dio/dio.dart' as dio; // Alias Dio as dio to avoid conflict with FormData
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../dependency/dependency_injection.dart';
import 'request_input.dart'; // Import the updated RequestInput
import 'response_state.dart';

// Callback for request state changes
typedef OnRequestStateChange<T> = void Function(ResponseState<T> state);

class DioService {
  DioService._(this._dio, this._storageService, {required this.onLogout}) : _debugMode = AppLogger.enableLogs;
  AuthCubit? authCubit;
  static final String _baseUrl = 'https://api.example.com';
  final Dio _dio;
  final StorageService _storageService;
  final bool _debugMode;
  Completer<void>? _refreshCompleter; // Manages the single refresh operation
  final Function()? onLogout;
  final List<_QueuedRequest> _queue = []; // Stores requests waiting for token refresh

  static Future<DioService> create({Function()? onLogout}) async {
    await getIt.isReady<StorageService>();
    final StorageService storageService = getIt.get();
    AppLogger.debug('Dio has been created', tag: 'dio');
    final dioInstance = Dio(
      dio.BaseOptions(
        baseUrl: _baseUrl, // Replace with your actual base URL
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
      ),
    );
    final instance = DioService._(dioInstance, storageService, onLogout: onLogout);

    // Add interceptor here after Dio instance is created
    instance._addInterceptors();
    return instance;
  }

  void _addInterceptors() {
    _dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) async {
          authCubit ??= appRouter.navigatorKey.currentContext?.read<AuthCubit>();
          if (_debugMode) {
            AppLogger.apiDebug('REQUEST[${options.method}] => PATH: ${options.path}', tag: options.path);
            AppLogger.apiDebug('Headers: ${options.headers}', tag: options.path);
            if (options.data != null) {
              final String dataString = options.data.toString();
              if (dataString.length > 500) {
                AppLogger.apiDebug(
                  'Request Data Type: ${options.data.runtimeType}, Size: ${dataString.length} bytes',
                  tag: options.path,
                );
              } else {
                AppLogger.apiDebug('Request Data: ${options.data}', tag: options.path);
              }
            }
          }
          // The requiresToken check and token injection are now handled in _buildRequestOptions and _injectToken
          // Only inject if header not already present or explicitly required
          if (options.extra['requiresToken'] ?? true) {
            // Make sure this flag is set in requestOptions.extra
            await _injectToken(options); // Ensure token is fresh before request
          }
          handler.next(options);
        },
        onResponse: (response, handler) {
          _logResponse(response); // Use unified logger
          handler.next(response);
        },
        onError: (DioException error, handler) async {
          if (_debugMode) {
            AppLogger.apiError(
              'ERROR[${error.response?.statusCode}] => PATH: ${error.requestOptions.path}',
              tag: error.requestOptions.path,
            );
            AppLogger.apiError('Error: ${error.message}', tag: error.requestOptions.path);
            if (error.response?.data != null) {
              AppLogger.apiError('Error Data: ${error.response?.data}', tag: error.requestOptions.path);
            }
          }

          if (error.response?.statusCode == 401) {
            // Check if the 401 is NOT from the refresh token endpoint itself
            if (error.requestOptions.path != '/auth/refresh') {
              // Replace with your actual refresh endpoint
              // Only one refresh at a time
              if (_refreshCompleter == null) {
                _refreshCompleter = Completer<void>();
                AppLogger.apiDebug('Attempting to refresh token...', tag: 'Auth');
                try {
                  await _refreshTokenIfNeeded();
                  AppLogger.apiDebug('Token refreshed successfully, retrying original request.', tag: 'Auth');
                  // After successful refresh, retry the original request
                  handler.resolve(await _dio.fetch(error.requestOptions));
                } catch (e) {
                  AppLogger.apiError('Failed to refresh token: $e', tag: 'Auth');
                  await clearTokens(); // Clear tokens on refresh failure
                  onLogout?.call(); // Trigger logout
                  handler.reject(error); // Reject the original request with the error
                } finally {
                  _refreshCompleter?.complete();
                  _refreshCompleter = null;
                  _processQueue(); // Process any queued requests
                }
              } else {
                // Token is already being refreshed, queue the current request
                // This request will be re-executed once the refresh is complete
                final responseCompleter = Completer<dio.Response>();
                _queue.add(_QueuedRequest(error.requestOptions, responseCompleter));
                // Wait for the responseCompleter to be completed (by _processQueue)
                // and then resolve/reject the original handler with that result.
                return responseCompleter.future.then(handler.resolve).catchError((Object err, StackTrace stackTrace) {
                  if (err is DioException) {
                    handler.reject(err);
                  } else {
                    // If it's not a DioException, wrap it or handle as a generic error
                    handler.reject(
                      DioException(
                        requestOptions: error.requestOptions, // Use original request options
                        error: err,
                        stackTrace: stackTrace,
                        message: err.toString(),
                      ),
                    );
                  }
                });
              }
            } else {
              // 401 on refresh token endpoint itself, clear tokens and logout
              AppLogger.apiError('401 received from refresh token endpoint. Logging out.', tag: 'Auth');
              await clearTokens();
              onLogout?.call();
              handler.reject(error); // Reject with the original error
            }
          } else {
            handler.next(error); // For other errors, just pass them on
          }
        },
      ),
    );
  }

  Future<void> _injectToken(RequestOptions options) async {
    final accessToken = authCubit?.state.userLoginInfoModel.accessToken;
    if (accessToken?.isNotEmpty == true) {
      options.headers['Authorization'] = 'Bearer ${authCubit?.state.userLoginInfoModel.accessToken}';
    }
  }

  Future<void> _saveTokens(String access, String refresh) async {
    await authCubit?.updateToken(accessToken: access, refreshToken: refresh);
  }

  Future<void> clearTokens() async {
    await _storageService.deleteAll();
    AppLogger.apiDebug('Tokens cleared.', tag: 'Auth');
  }

  Future<ResponseState<T>> request<T>({
    required RequestInput input,
    required T Function(dynamic data) responseBuilder,
    int retryCount = 0,
    int maxRetry = 2,
  }) async {
    final cancelToken = CancelToken(); // Use provided token or create new

    try {
      final requestOptions = await _buildRequestOptions(input);

      dio.Response response;
      // Use _dio.request for consistency in method calls
      // The actual method (GET, POST, etc.) is set in requestOptions.options.method
      response = await _dio.request(
        requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: requestOptions.options,
        cancelToken: cancelToken,
        onSendProgress: input.onSendProgress,
        onReceiveProgress: input.onReceiveProgress,
      );

      final parsed = responseBuilder(response.data);
      return ResponseState(
        data: parsed,
        message: response.statusMessage,
        cancelToken: cancelToken,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      if (e.type == DioExceptionType.cancel) {
        AppLogger.apiDebug('Request cancelled: ${e.message}', tag: input.endpoint);
        rethrow; // Re-throw to propagate cancellation if needed
      }

      // Important: The interceptor will handle the 401 re-execution logic.
      // We still re-throw the error here so the interceptor gets a chance to catch it.
      // The `onStateChange` will be triggered by the initial 401, but the subsequent
      // successful retry (if any) will not update this specific `onStateChange`
      // because it's a new `dio.fetch` call from the interceptor.
      // To fully reflect retries on UI, consider a more complex state, or let interceptor
      // handle all `onStateChange` updates for retried requests.
      // For now, this structure correctly handles the 401 re-execution flow.

      if (_shouldRetry(e) && retryCount < maxRetry) {
        AppLogger.apiDebug('Retrying request (attempt ${retryCount + 1})...', tag: input.endpoint);
        await Future.delayed(const Duration(milliseconds: 300));
        return request(
          // Recursive call to retry
          input: input,
          responseBuilder: responseBuilder,
          retryCount: retryCount + 1,
          maxRetry: maxRetry,
        );
      }

      final err = _parseError(e);
      AppLogger.apiError('Request failed: $err', tag: input.endpoint);
      rethrow; // Re-throw the error for higher-level handling
    } catch (e) {
      final err = e.toString();
      AppLogger.apiError('Unknown error occurred: $err', tag: input.endpoint);
      rethrow; // Re-throw for higher-level handling
    }
  }

  // Refactored refresh logic to be called directly by the interceptor
  Future<void> _refreshTokenIfNeeded() async {
    final refreshToken = authCubit?.state.userLoginInfoModel.refreshToken;

    if (refreshToken?.isEmpty == true || refreshToken == null) {
      AppLogger.debug('No refresh token available.', tag: 'DIO service');
      return;
    }
    try {
      final response = await _dio.post(
        '/auth/refresh', // Replace with your actual refresh token endpoint
        data: {'refresh_token': refreshToken},
        options: dio.Options(extra: {'requiresToken': false}), // Refresh token request does not require token
      );
      if (response.statusCode == 200) {
        final access = response.data['access_token'];
        final refresh = response.data['refresh_token'];
        await _saveTokens(access, refresh);
      } else {
        throw Exception('Refresh token failed with status: ${response.statusCode}');
      }
    } on DioException catch (e) {
      AppLogger.apiError('DioException during token refresh: ${e.message}', tag: 'Auth');
      throw Exception('Refresh token failed: ${e.message}');
    } catch (e) {
      AppLogger.apiError('Error during token refresh: $e', tag: 'Auth');
      throw Exception('Refresh token failed: $e');
    }
  }

  void _processQueue() {
    // Process queued requests after token refresh
    while (_queue.isNotEmpty) {
      final req = _queue.removeAt(0);
      _dio.fetch(req.requestOptions).then(req.completer.complete).catchError(req.completer.completeError);
    }
  }

  bool _shouldRetry(DioException e) =>
      e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.sendTimeout ||
      e.type == DioExceptionType.unknown;

  Future<_RequestOptionsData> _buildRequestOptions(RequestInput input) async {
    final accessToken = authCubit?.state.userLoginInfoModel.accessToken;

    String url = input.endpoint;
    input.pathParams?.forEach((k, v) => url = url.replaceAll('{$k}', Uri.encodeComponent(v.toString())));

    final headers = {
      if (input.requiresToken && accessToken?.isNotEmpty == true) 'Authorization': 'Bearer $accessToken',
      ...?input.headers,
    };

    dynamic body;
    String contentType = 'application/json'; // Default content type

    if (input.files != null && input.files!.isNotEmpty || input.formFields != null) {
      final formData = dio.FormData();
      if (input.formFields != null) {
        formData.fields.addAll(input.formFields!.entries.map((e) => MapEntry(e.key, e.value.toString())));
      }
      if (input.files != null) {
        input.files!.forEach((key, file) {
          formData.files.add(MapEntry(key, file));
        });
      }
      body = formData;
      contentType = 'multipart/form-data';
    } else if (input.jsonBody != null) {
      body = input.jsonBody;
      contentType = 'application/json';
    }

    return _RequestOptionsData(
      path: url,
      data: body,
      queryParameters: input.queryParams,
      options: dio.Options(
        // Use dio.Options to avoid conflict with dart:io.Options if any
        method: input.method.toString().split('.').last.toUpperCase(), // Set HTTP method from enum
        headers: headers,
        contentType: contentType,
        sendTimeout: input.timeout,
        receiveTimeout: input.timeout,
        extra: {'requiresToken': input.requiresToken}, // Pass requiresToken via extra
      ),
    );
  }

  String _parseError(DioException e) {
    if (e.response?.data != null && e.response!.data is Map) {
      final data = e.response!.data as Map<String, dynamic>;
      // Attempt to find a common error message key
      if (data.containsKey('message')) {
        return data['message'].toString();
      } else if (data.containsKey('error')) {
        return data['error'].toString();
      } else if (data.containsKey('detail')) {
        return data['detail'].toString();
      }
    }
    return e.message ?? 'An unknown error occurred.';
  }

  void _logResponse(dio.Response res) {
    if (!_debugMode) {
      return;
    }
    try {
      final str = res.data.toString();
      AppLogger.apiDebug(
        str.length < 500 ? 'Response: $str' : 'Response: [${str.runtimeType}, ${str.length} chars]',
        tag: res.realUri.path,
      );
    } catch (e) {
      AppLogger.error('Failed to print response due to error: $e', tag: res.realUri.path);
    }
  }
}

// Data class to hold options needed to execute a Dio request
class _RequestOptionsData {
  _RequestOptionsData({required this.path, required this.data, required this.queryParameters, required this.options});

  final String path;
  final dynamic data;
  final Map<String, dynamic>? queryParameters;
  final dio.Options options; // Use dio.Options
}

// Queued request for interceptor refresh logic
class _QueuedRequest {
  _QueuedRequest(this.requestOptions, this.completer);

  final RequestOptions requestOptions; // Stores the original request options
  final Completer<dio.Response> completer; // Completes with the result of the retried request
}
