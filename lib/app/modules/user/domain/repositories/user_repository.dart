import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';

import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getRandom();

  Future<Either<Failure, List<UserEntity>>> getAllSaved();

  Future<Either<Failure, bool>> save({required UserEntity user});

  Future<Either<Failure, bool>> delete({required UserEntity user});
}
