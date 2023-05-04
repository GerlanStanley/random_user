import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';

import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

import 'delete_user_use_case.dart';

class DeleteUserUseCaseImpl implements DeleteUserUseCase {
  final UserRepository _repository;

  DeleteUserUseCaseImpl(this._repository);

  @override
  Future<Either<Failure, bool>> call({required UserEntity user}) {
    return _repository.delete(user: user);
  }
}
