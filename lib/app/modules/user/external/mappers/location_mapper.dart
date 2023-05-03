import '../../domain/entities/location_entity.dart';

class LocationMapper {
  static LocationEntity fromMap(Map json) {
    return LocationEntity(
      streetNumber: json.containsKey('street_number')
          ? json['street_number']
          : json['street']['number'],
      streetName: json.containsKey('street_name')
          ? json['street_name']
          : json['street']['name'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'],
      latitude: json.containsKey('latitude')
          ? json['latitude']
          : json['coordinates']['latitude'],
      longitude: json.containsKey('longitude')
          ? json['longitude']
          : json['coordinates']['longitude'],
    );
  }
}
