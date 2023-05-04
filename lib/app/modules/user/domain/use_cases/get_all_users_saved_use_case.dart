import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';

import '../entities/user_entity.dart';

abstract class GetAllUsersSavedUseCase {
  Future<Either<Failure, List<UserEntity>>> call();
}
