import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:list_fm/core/constants/app_constants.dart';
import 'package:list_fm/features/search_user/data/data_sources/remote/user_remote_data_source.dart';
import 'package:list_fm/features/search_user/data/repositories/user_repository.dart';
import 'package:list_fm/features/search_user/domain/repositories/i_user_repository.dart';
import 'features/search_user/domain/usercases/get_user_usecase.dart';
import 'features/search_user/presentation/stores/search_user_store.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // -----------------------------
  // Core / HTTP
  // -----------------------------
  getIt.registerLazySingleton<Dio>(
    () =>
        Dio(
            BaseOptions(
              baseUrl: AppConstants.baseUrl,
              queryParameters: {
                "format": "json",
                "api_key": AppConstants.apiKey,
              },
            ),
          )
          ..interceptors.add(
            LogInterceptor(
              requestBody: true,
              responseBody: true,
              error: true,
            ),
          ),
  );

  // -----------------------------
  // Data Source
  // -----------------------------
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSource(getIt()),
  );

  // -----------------------------
  // Repository
  // -----------------------------
  getIt.registerLazySingleton<IUserRepository>(
    () => UserRepository(
      userRemoteDataSource: getIt(),
    ),
  );

  // -----------------------------
  // Usecase
  // -----------------------------
  getIt.registerLazySingleton<SearchUserUsecase>(
    () => SearchUserUsecase(getIt()),
  );

  // -----------------------------
  // Store (MobX)
  // -----------------------------
  getIt.registerFactory<SearchUserStore>(
    () => SearchUserStore(getUserUsecase: getIt()),
  );
}
