import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';

import '../data_sources/remote_user_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteUserDataSource _remoteDataSource;

  UserRepositoryImpl(
    this._remoteDataSource,
  );

  @override
  Future<Either<Failure, UserEntity>> getRandom() async {
    try {
      var result = await _remoteDataSource.getRandom();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
