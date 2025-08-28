import 'dart:io';

import 'package:dio/dio.dart';
import 'package:list_fm/core/network/network_data_state.dart';
import 'package:list_fm/features/search_user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:list_fm/features/search_user/domain/entities/user_entity.dart';
import 'package:list_fm/features/search_user/domain/repositories/i_user_repository.dart';

class UserRepository implements IUserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRepository({required UserRemoteDataSource userRemoteDataSource}) : _userRemoteDataSource = userRemoteDataSource;

  @override
  Future<NetworkDataState<UserEntity>> getUserByName(String name) async {
    try {
      final response = await _userRemoteDataSource.getUserByName(name: name);

      if (response.response.statusCode == HttpStatus.ok) {
        return NetworkDataSuccess(response.data);
      }
      return NetworkDataFailure(
        DioException(
          requestOptions: response.response.requestOptions,
          error: response.response.statusCode,
          type: DioExceptionType.badResponse,
          message: response.response.data['message'],
        ),
      );
    } on DioException catch (e) {
      return NetworkDataFailure(e);
    }
  }
}
