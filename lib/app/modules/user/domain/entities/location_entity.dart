class LocationEntity {
  final int streetNumber;
  final String streetName;
  final String city;
  final String state;
  final String country;
  final String postcode;
  final String latitude;
  final String longitude;
  final String timezoneOffset;

  LocationEntity({
    required this.streetNumber,
    required this.streetName,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.latitude,
    required this.longitude,
    required this.timezoneOffset,
  });
}