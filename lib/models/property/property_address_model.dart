class PropertyAddressModel {
  final int id;
  final String? longitude;
  final String? latitude;
  final String? country;
  final String? state;
  final String? city;
  final String? subCity;
  final String? woreda;



  const PropertyAddressModel({
    required this.id,
    this.longitude,
    this.latitude,
    this.country,
    this.state,
    this.city,
    this.subCity,
    this.woreda,
  });

  factory PropertyAddressModel.fromJson(Map<String, dynamic> json) => PropertyAddressModel(
    id: json['id'],
    longitude: json['longitude'],
    latitude: json['latitude'],
    country: json['country']['name'],
    state: json['state']['name'],
    city: json['city']['name'],
    subCity: json['subcity']['name'],
    woreda: json['woreda']['name'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'longitude': longitude,
    'latitude': latitude,
    'country': country,
    'state': state,
    'city': city,
    'subCity': subCity,
    'woreda': woreda,
  };

  @override
  String toString() {
    return 'PropertyAddressModel(id: $id, longitude: $longitude, latitude: $latitude, country: $country, state: $state, city: $city, subCity: $subCity, woreda: $woreda)';
  }
}
