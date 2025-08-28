import 'package:dio/dio.dart';

sealed class NetworkDataState<T> {
  final T? data;
  final DioException? error;

  const NetworkDataState({this.data, this.error});
}

class NetworkDataSuccess<T> extends NetworkDataState<T> {
  const NetworkDataSuccess(T data) : super(data: data);
}

class NetworkDataFailure<T> extends NetworkDataState<T> {
  const NetworkDataFailure(DioException error) : super(error: error);
}
