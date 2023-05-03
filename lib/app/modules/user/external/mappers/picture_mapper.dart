import '../../domain/entities/picture_entity.dart';

class PictureMapper {
  static PictureEntity fromMap(Map json) {
    return PictureEntity(
      large: json['large'],
      medium: json['medium'],
      thumbnail: json['thumbnail'],
    );
  }
}
