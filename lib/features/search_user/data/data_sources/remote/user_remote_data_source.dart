import 'package:dio/dio.dart';
import 'package:list_fm/features/search_user/data/models/user_model.dart';
import 'package:retrofit/retrofit.dart';

part 'user_remote_data_source.g.dart';

@RestApi()
abstract class UserRemoteDataSource {
  factory UserRemoteDataSource(Dio dio) = _UserRemoteDataSource;

  @GET('')
  Future<HttpResponse<UserModel>> getUserByName({
    @Query('method') String? method = 'user.getinfo',
    @Query('user') String? name,
  });
}
