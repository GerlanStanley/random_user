// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SaveUserStore on SaveUserStoreBase, Store {
  late final _$stateAtom =
      Atom(name: 'SaveUserStoreBase.state', context: context);

  @override
  SaveUserState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(SaveUserState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('SaveUserStoreBase.save', context: context);

  @override
  Future<void> save({required UserEntity user}) {
    return _$saveAsyncAction.run(() => super.save(user: user));
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
