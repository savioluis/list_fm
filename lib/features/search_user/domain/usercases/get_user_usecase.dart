import 'package:list_fm/core/network/network_data_state.dart';
import 'package:list_fm/core/usecases/usecase.dart';
import 'package:list_fm/features/search_user/domain/entities/user_entity.dart';
import 'package:list_fm/features/search_user/domain/repositories/i_user_repository.dart';

class SearchUserUsecase implements Usecase<NetworkDataState<UserEntity>, String> {
  final IUserRepository _userRepository;

  SearchUserUsecase(this._userRepository);

  @override
  Future<NetworkDataState<UserEntity>> call({String? params}) {
    return _userRepository.getUserByName(params ?? '');
  }
}
