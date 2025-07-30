import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio; // Alias Dio as dio to avoid conflict with MultipartFile.fromFile

enum RequestMethod { GET, POST, PUT, DELETE }

class RequestInput { 

  RequestInput({
    required this.endpoint,
    required this.method, 
    this.pathParams,
    this.queryParams,
    this.headers,
    this.formFields,
    this.jsonBody,
    this.files,
    this.timeout,
    this.onSendProgress,
    this.onReceiveProgress,
    this.requiresToken = true,
    this.cancelToken,
  });
  final String endpoint; 
  final RequestMethod method;
  final Map<String, dynamic>? pathParams;
  final Map<String, dynamic>? queryParams;
  final Map<String, String>? headers;
  final Map<String, dynamic>? formFields;
  final Map<String, dynamic>? jsonBody;
  final Map<String, dio.MultipartFile>? files; 
  final Duration? timeout;
  final Function(int, int)? onSendProgress;
  final Function(int, int)? onReceiveProgress;
  final bool requiresToken;
  final CancelToken? cancelToken;
}
