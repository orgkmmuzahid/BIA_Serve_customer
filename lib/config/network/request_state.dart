import 'package:dio/dio.dart';

class RequestState<T> {

  RequestState({
    this.data,
    this.isRequesting = false,
    this.error,
    this.cancelToken
  });
  
  final T? data;
  final bool isRequesting;
  final String? error;
  final CancelToken? cancelToken;
}
