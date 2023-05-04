import '../../domain/entities/name_entity.dart';

class NameMapper {
  static NameEntity fromMap(Map json) {
    return NameEntity(
      title: json['title'],
      first: json['first'],
      last: json['last'],
    );
  }

  static Map toMap(NameEntity entity) {
    return {
      'title': entity.title,
      'first': entity.first,
      'last': entity.last,
    };
  }
}
