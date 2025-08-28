import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:list_fm/core/network/network_data_state.dart';
import 'package:list_fm/features/search_user/domain/entities/user_entity.dart';
import 'package:list_fm/features/search_user/domain/usercases/get_user_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:list_fm/features/search_user/domain/repositories/i_user_repository.dart';
import 'package:mockito/mockito.dart';

import 'get_user_usecase_test.mocks.dart';

@GenerateMocks([IUserRepository])
void main() {
  late SearchUserUsecase usecase;
  late MockIUserRepository mockRepository;

  setUp(() {
    provideDummyBuilder<NetworkDataState<UserEntity>>(
      (parent, invocation) => NetworkDataSuccess(UserEntity(name: "dummy")),
    );
    mockRepository = MockIUserRepository();
    usecase = SearchUserUsecase(mockRepository);
  });

  final testUser = UserEntity(
    name: 'nomequalquer',
    imageUrl: 'https://example.com/avatar.png',
  );

  group('GetUserUsecase', () {
    test('deve retornar NetworkDataSuccess quando o repository retornar sucesso', () async {
      when(
        mockRepository.getUserByName('nomequalquer'),
      ).thenAnswer((_) async => NetworkDataSuccess(testUser));

      final result = await usecase.call(params: 'nomequalquer');

      expect(result, isA<NetworkDataSuccess<UserEntity>>());
      expect((result as NetworkDataSuccess).data.name, 'nomequalquer');
    });

    test('deve retornar NetworkDataFailure quando o repository retornar erro', () async {
      final dioException = DioException(requestOptions: RequestOptions());
      when(mockRepository.getUserByName('nomequalquer')).thenAnswer((_) async => NetworkDataFailure(dioException));

      final result = await usecase.call(params: 'nomequalquer');

      expect(result, isA<NetworkDataFailure<UserEntity>>());
      expect((result as NetworkDataFailure).error, dioException);
    });
  });
}
