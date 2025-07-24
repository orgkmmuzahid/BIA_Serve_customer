// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class RequestState<T> {

  RequestState({
    required this.data,
    this.isRequesting = false,
    this.error,
    this.cancelToken
  });
  
  final T data;
  final bool isRequesting;
  final String? error;
  final CancelToken? cancelToken;

  RequestState<T> copyWith({
    T? data,
    bool? isRequesting,
    String? error,
    CancelToken? cancelToken,
  }) {
    return RequestState<T>(
      data: data ?? this.data,
      isRequesting: isRequesting ?? this.isRequesting,
      error: error ?? this.error,
      cancelToken: cancelToken ?? this.cancelToken,
    );
  }
}
