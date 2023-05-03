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
}
