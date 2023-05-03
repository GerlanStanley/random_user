import 'location_entity.dart';
import 'name_entity.dart';
import 'picture_entity.dart';

class UserEntity {
  final String uuid;
  final String gender;
  final String email;
  final DateTime birthdate;
  final int age;
  final String phone;
  final String cell;
  final NameEntity name;
  final LocationEntity location;
  final PictureEntity picture;

  UserEntity({
    required this.uuid,
    required this.gender,
    required this.email,
    required this.birthdate,
    required this.age,
    required this.phone,
    required this.cell,
    required this.name,
    required this.location,
    required this.picture,
  });
}
