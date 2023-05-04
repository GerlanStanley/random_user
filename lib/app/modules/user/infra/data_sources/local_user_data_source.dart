import '../../domain/entities/user_entity.dart';

abstract class LocalUserDataSource {
  Future<List<UserEntity>> getAll();

  Future<bool> save({required UserEntity user});
}
