// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DeleteUserStore on DeleteUserStoreBase, Store {
  late final _$stateAtom =
      Atom(name: 'DeleteUserStoreBase.state', context: context);

  @override
  DeleteUserState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(DeleteUserState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$deleteAsyncAction =
      AsyncAction('DeleteUserStoreBase.delete', context: context);

  @override
  Future<void> delete({required UserEntity user}) {
    return _$deleteAsyncAction.run(() => super.delete(user: user));
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
