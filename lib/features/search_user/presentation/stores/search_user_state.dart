// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import 'package:list_fm/features/search_user/domain/entities/user_entity.dart';

sealed class SearchUserState extends Equatable {
  final List<UserEntity>? users;
  final DioException? error;

  const SearchUserState({this.users, this.error});

  @override
  List<Object?> get props => [users, error];
}

class SearchUserInitialState extends SearchUserState {
  const SearchUserInitialState();
}

class SearchUserLoadingState extends SearchUserState {
  const SearchUserLoadingState();
}

class SearchUserSuccessState extends SearchUserState {
  final List<UserEntity>? selectedUsers;

  const SearchUserSuccessState({this.selectedUsers, super.users});

  SearchUserSuccessState copyWith({
    List<UserEntity>? selectedUsers,
  }) {
    return SearchUserSuccessState(
      selectedUsers: selectedUsers ?? this.selectedUsers,
    );
  }
}

class SearchUserFailureState extends SearchUserState {
  const SearchUserFailureState({super.error});
}
