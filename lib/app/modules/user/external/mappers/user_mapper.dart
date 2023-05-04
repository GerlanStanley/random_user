import '../../../../core/utils/utils.dart';

import '../../domain/entities/user_entity.dart';

import 'location_mapper.dart';
import 'name_mapper.dart';
import 'picture_mapper.dart';

class UserMapper {
  static UserEntity fromMap(Map json) {
    return UserEntity(
      uuid: json.containsKey('uuid') ? json['uuid'] : json['login']['uuid'],
      gender: json['gender'],
      email: json['email'],
      birthdate: DateTime.parse(
        json.containsKey('birthdate') ? json['birthdate'] : json['dob']['date'],
      ),
      age: json.containsKey('age') ? json['age'] : json['dob']['age'],
      phone: json['phone'],
      cell: json['cell'],
      name: NameMapper.fromMap(json['name']),
      location: LocationMapper.fromMap(json['location']),
      picture: PictureMapper.fromMap(json['picture']),
    );
  }

  static Map toMap(UserEntity entity) {
    return {
      'uuid': entity.uuid,
      'gender': entity.gender,
      'email': entity.email,
      'birthdate': DateTimeUtils.formattedDatabaseDateTime(entity.birthdate),
      'age': entity.age,
      'phone': entity.phone,
      'cell': entity.cell,
      'name': NameMapper.toMap(entity.name),
      'location': LocationMapper.toMap(entity.location),
      'picture': PictureMapper.toMap(entity.picture),
    };
  }
}
