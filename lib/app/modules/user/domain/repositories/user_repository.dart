import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';

import '../entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> getRandom();
}