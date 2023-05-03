class LocationEntity {
  final int streetNumber;
  final String streetName;
  final String city;
  final String state;
  final String country;
  final int postcode;
  final String latitude;
  final String longitude;

  LocationEntity({
    required this.streetNumber,
    required this.streetName,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.latitude,
    required this.longitude,
  });
}