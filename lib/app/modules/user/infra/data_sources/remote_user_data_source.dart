import '../../domain/entities/user_entity.dart';

abstract class RemoteUserDataSource {
  Future<UserEntity> getRandom();
}
