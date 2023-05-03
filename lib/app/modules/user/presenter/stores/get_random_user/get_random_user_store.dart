import 'package:mobx/mobx.dart';

import '../../../domain/use_cases/get_random_user_use_case.dart';

import 'get_random_user_state.dart';

part 'get_random_user_store.g.dart';

class GetRandomUserStore = GetRandomUserStoreBase with _$GetRandomUserStore;

abstract class GetRandomUserStoreBase with Store {
  final GetRandomUserUseCase _getRandomUser;

  @observable
  GetRandomUserState state = InitialGetRandomUserState();

  GetRandomUserStoreBase(this._getRandomUser);

  @action
  Future<void> getRandom() async {
    state = LoadingGetRandomUserState();

    var result = await _getRandomUser();

    result.fold((left) {
      state = FailureGetRandomUserState(error: left.message);
    }, (right) async {
      state = SuccessGetRandomUserState(user: right);
    });
  }
}