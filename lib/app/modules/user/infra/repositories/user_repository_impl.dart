import 'package:dartz/dartz.dart';

import '../../../../core/failures/failures.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/user_repository.dart';

import '../data_sources/local_user_data_source.dart';
import '../data_sources/remote_user_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteUserDataSource _remoteDataSource;
  final LocalUserDataSource _localDataSource;

  UserRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
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

  @override
  Future<Either<Failure, List<UserEntity>>> getAllSaved() async {
    try {
      var response = await _localDataSource.getAll();
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Failure, bool>> save({required UserEntity user}) async {
    try {
      var response = await _localDataSource.save(user: user);
      return Right(response);
    } on Failure catch (e) {
      return Left(e);
    }
  }
}
