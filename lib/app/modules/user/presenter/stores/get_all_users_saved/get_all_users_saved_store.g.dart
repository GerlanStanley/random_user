// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_users_saved_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetAllUsersSavedStore on GetAllUsersSavedStoreBase, Store {
  late final _$stateAtom =
      Atom(name: 'GetAllUsersSavedStoreBase.state', context: context);

  @override
  GetAllUsersSavedState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(GetAllUsersSavedState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$getAllAsyncAction =
      AsyncAction('GetAllUsersSavedStoreBase.getAll', context: context);

  @override
  Future<void> getAll() {
    return _$getAllAsyncAction.run(() => super.getAll());
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
