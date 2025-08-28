import 'package:list_fm/core/network/network_data_state.dart';
import 'package:list_fm/features/search_user/domain/entities/user_entity.dart';

abstract interface class IUserRepository {
  Future<NetworkDataState<UserEntity>> getUserByName(String name);
}
