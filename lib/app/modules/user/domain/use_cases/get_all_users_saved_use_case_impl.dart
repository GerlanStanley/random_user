import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';

import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

import 'get_all_users_saved_use_case.dart';

class GetAllUsersSavedUseCaseImpl implements GetAllUsersSavedUseCase {
  final UserRepository _repository;

  GetAllUsersSavedUseCaseImpl(this._repository);

  @override
  Future<Either<Failure, List<UserEntity>>> call() async {
    return await _repository.getAllSaved();
  }
}
