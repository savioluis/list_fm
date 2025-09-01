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
  const SearchUserInitialState({this.searchNotFound = false});

  final bool searchNotFound;
}

class SearchUserLoadingState extends SearchUserState {
  const SearchUserLoadingState();
}

class SearchUserSuccessState extends SearchUserState {
  final bool searchNotFound;
  final bool isLoadingMore;
  final bool userAlreadyFetched;

  const SearchUserSuccessState({
    this.isLoadingMore = false,
    this.searchNotFound = false,
    this.userAlreadyFetched = false,
    super.users,
  });

  SearchUserSuccessState copyWith({
    bool? searchNotFound,
    bool? isLoadingMore,
    bool? userAlreadyFetched,
  }) {
    return SearchUserSuccessState(
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      searchNotFound: searchNotFound ?? this.searchNotFound,
      userAlreadyFetched: userAlreadyFetched ?? this.userAlreadyFetched,
      users: super.users,
    );
  }

  @override
  List<Object?> get props => [
    searchNotFound,
    isLoadingMore,
    userAlreadyFetched,
    super.users,
  ];
}

class SearchUserFailureState extends SearchUserState {
  const SearchUserFailureState({super.error});
}
