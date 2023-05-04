import 'package:mobx/mobx.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/use_cases/save_user_use_case.dart';

import 'save_user_state.dart';

part 'save_user_store.g.dart';

class SaveUserStore = SaveUserStoreBase with _$SaveUserStore;

abstract class SaveUserStoreBase with Store {
  final SaveUserUseCase _saveUser;

  @observable
  SaveUserState state = InitialSaveUserState();

  SaveUserStoreBase(this._saveUser);

  @action
  Future<void> save({required UserEntity user}) async {
    state = LoadingSaveUserState();

    await Future.delayed(const Duration(milliseconds: 500));

    var result = await _saveUser(user: user);

    result.fold((left) {
      state = FailureSaveUserState(error: left.message);
    }, (right) async {
      state = SuccessSaveUserState();
    });
  }
}
