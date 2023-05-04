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
      postcode: json['postcode'].toString(),
      latitude: json.containsKey('latitude')
          ? json['latitude']
          : json['coordinates']['latitude'],
      longitude: json.containsKey('longitude')
          ? json['longitude']
          : json['coordinates']['longitude'],
      timezoneOffset: json.containsKey('timezone_offset')
          ? json['timezone_offset']
          : json['timezone']['offset'],
    );
  }

  static Map toMap(LocationEntity entity) {
    return {
      'street_number': entity.streetNumber,
      'street_name': entity.streetName,
      'city': entity.city,
      'state': entity.state,
      'country': entity.country,
      'postcode': entity.postcode,
      'latitude': entity.latitude,
      'longitude': entity.longitude,
      'timezone_offset': entity.timezoneOffset,
    };
  }
}
