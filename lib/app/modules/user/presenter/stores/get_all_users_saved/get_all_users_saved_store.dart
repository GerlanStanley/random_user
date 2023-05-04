import 'package:mobx/mobx.dart';

import '../../../domain/use_cases/get_all_users_saved_use_case.dart';

import 'get_all_users_saved_state.dart';

part 'get_all_users_saved_store.g.dart';

class GetAllUsersSavedStore = GetAllUsersSavedStoreBase
    with _$GetAllUsersSavedStore;

abstract class GetAllUsersSavedStoreBase with Store {
  final GetAllUsersSavedUseCase _getAllUsersSaved;

  @observable
  GetAllUsersSavedState state = InitialGetAllUsersSavedState();

  GetAllUsersSavedStoreBase(this._getAllUsersSaved);

  @action
  Future<void> getAll() async {
    state = LoadingGetAllUsersSavedState();

    var result = await _getAllUsersSaved();

    result.fold((left) {
      state = FailureGetAllUsersSavedState(error: left.message);
    }, (right) async {
      state = SuccessGetAllUsersSavedState(users: right);
    });
  }
}
