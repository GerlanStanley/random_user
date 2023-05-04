import 'package:mobx/mobx.dart';

import '../../../domain/entities/user_entity.dart';
import '../../../domain/use_cases/delete_user_use_case.dart';

import 'delete_user_state.dart';

part 'delete_user_store.g.dart';

class DeleteUserStore = DeleteUserStoreBase with _$DeleteUserStore;

abstract class DeleteUserStoreBase with Store {
  final DeleteUserUseCase _deleteUser;

  @observable
  DeleteUserState state = InitialDeleteUserState();

  DeleteUserStoreBase(this._deleteUser);

  @action
  Future<void> delete({required UserEntity user}) async {
    state = LoadingDeleteUserState();

    var result = await _deleteUser(user: user);

    result.fold((left) {
      state = FailureDeleteUserState(error: left.message);
    }, (right) async {
      state = SuccessDeleteUserState();
    });

    await Future.delayed(const Duration(milliseconds: 500));
    state = InitialDeleteUserState();
  }
}
