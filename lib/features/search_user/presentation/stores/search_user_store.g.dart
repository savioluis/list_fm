// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchUserStore on _SearchUserStore, Store {
  late final _$stateAtom = Atom(
    name: '_SearchUserStore.state',
    context: context,
  );

  @override
  SearchUserState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(SearchUserState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$fetchUserAsyncAction = AsyncAction(
    '_SearchUserStore.fetchUser',
    context: context,
  );

  @override
  Future<void> fetchUser(String username) {
    return _$fetchUserAsyncAction.run(() => super.fetchUser(username));
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
