// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_random_user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GetRandomUserStore on GetRandomUserStoreBase, Store {
  late final _$stateAtom =
      Atom(name: 'GetRandomUserStoreBase.state', context: context);

  @override
  GetRandomUserState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(GetRandomUserState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$getRandomAsyncAction =
      AsyncAction('GetRandomUserStoreBase.getRandom', context: context);

  @override
  Future<void> getRandom() {
    return _$getRandomAsyncAction.run(() => super.getRandom());
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
