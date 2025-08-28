import 'package:list_fm/core/network/network_data_state.dart';
import 'package:list_fm/features/search_user/domain/entities/user_entity.dart';
import 'package:list_fm/features/search_user/domain/usercases/get_user_usecase.dart';
import 'package:list_fm/features/search_user/presentation/stores/search_user_state.dart';
import 'package:mobx/mobx.dart';

part 'search_user_store.g.dart';

class SearchUserStore = _SearchUserStore with _$SearchUserStore;

abstract class _SearchUserStore with Store {
  final SearchUserUsecase _getUserUsecase;

  _SearchUserStore({required SearchUserUsecase getUserUsecase})
    : _getUserUsecase = getUserUsecase,
      state = SearchUserInitialState();

  @observable
  SearchUserState state;

  @action
  Future<void> fetchUser(String username) async {
    final currentState = state;

    state = SearchUserLoadingState();

    final result = await _getUserUsecase.call(params: username);

    if (result is NetworkDataSuccess) {
      state = SearchUserSuccessState(
        users: [...currentState.users ?? [], ?result.data],
      );
    } else if (result is NetworkDataFailure) {
      state = SearchUserFailureState(
        error: result.error,
      );
    }
  }
}
