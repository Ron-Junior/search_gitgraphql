// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UsersStore on _UsersStoreBase, Store {
  final _$fetchUsersAsyncAction = AsyncAction('_UsersStoreBase.fetchUsers');

  @override
  Future<dynamic> fetchUsers(String value) {
    return _$fetchUsersAsyncAction.run(() => super.fetchUsers(value));
  }

  final _$fetchMoreUsersAsyncAction =
      AsyncAction('_UsersStoreBase.fetchMoreUsers');

  @override
  Future<dynamic> fetchMoreUsers() {
    return _$fetchMoreUsersAsyncAction.run(() => super.fetchMoreUsers());
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
