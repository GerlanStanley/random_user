import '../../domain/entities/name_entity.dart';

class NameMapper {
  static NameEntity fromMap(Map json) {
    return NameEntity(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }
}
