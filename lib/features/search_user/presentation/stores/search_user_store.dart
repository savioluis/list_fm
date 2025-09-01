import 'dart:async';

import 'package:list_fm/core/network/network_data_state.dart';
import 'package:list_fm/features/search_user/domain/usercases/search_user_usecase.dart';
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

    if (currentState is SearchUserSuccessState) {
      state = currentState.copyWith(isLoadingMore: true);
    } else {
      state = SearchUserLoadingState();
    }

    final result = await _getUserUsecase.call(params: username);

    if (result is NetworkDataSuccess) {
      if (currentState is SearchUserSuccessState) {
        final userAlreadyFetched = currentState.users!.any((user) => user.name == username);

        userAlreadyFetched
            ? state = currentState.copyWith(userAlreadyFetched: true)
            : state = SearchUserSuccessState(
                users: [...currentState.users ?? [], ?result.data],
                searchNotFound: false,
                userAlreadyFetched: false,
                isLoadingMore: false,
              );
        return;
      } else if (currentState is SearchUserInitialState || currentState is SearchUserLoadingState) {
        state = SearchUserSuccessState(
          users: [...currentState.users ?? [], ?result.data],
          searchNotFound: false,
        );
        return;
      }
    } else if (result is NetworkDataFailure) {
      final isNotFoundError = (result.error!.response?.data["error"] == 6);

      if (currentState is SearchUserSuccessState) {
        if (isNotFoundError) {
          state = currentState.copyWith(searchNotFound: true);
          return;
        }
      } else {
        if (isNotFoundError) {
          state = SearchUserInitialState(searchNotFound: true);
        } else {
          state = SearchUserFailureState(error: result.error);
        }
      }
    }
  }
}
