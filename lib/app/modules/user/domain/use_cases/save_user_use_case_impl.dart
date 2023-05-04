import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';

import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

import 'save_user_use_case.dart';

class SaveUserUseCaseImpl implements SaveUserUseCase {
  final UserRepository _repository;

  SaveUserUseCaseImpl(this._repository);

  @override
  Future<Either<Failure, bool>> call({required UserEntity user}) {
    return _repository.save(user: user);
  }
}
