import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';

import '../entities/user_entity.dart';
import '../repositories/user_repository.dart';

import 'get_random_user_use_case.dart';

class GetRandomUserUseCaseImpl implements GetRandomUserUseCase {
  final UserRepository _repository;

  GetRandomUserUseCaseImpl(this._repository);

  @override
  Future<Either<Failure, UserEntity>> call() async {
    return await _repository.getRandom();
  }
}
