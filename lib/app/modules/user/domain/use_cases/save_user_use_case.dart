import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';

import '../entities/user_entity.dart';

abstract class SaveUserUseCase {
  Future<Either<Failure, bool>> call({required UserEntity user});
}
