class Address {
  String street;
  String building;
  String city;
  String state;
  String zipCode;
  double lat;
  double lng;

  Address({
    required this.street,
    required this.building,
    required this.city,
    required this.state,
    required this.zipCode,
    required this.lat,
    required this.lng,
  });

  // Factory method to create an instance of the model from JSON
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] as String,
      building: json['building'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      zipCode: json['zip_code'] as String,
      lat: json['lat'] as double,
      lng: json['lang'] as double,
    );
  }

  // Method to convert the model to JSON
  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'building': building,
      'city': city,
      'state': state,
      'zip_code': zipCode,
      'lat': lat,
      'lang': lng,
    };
  }
}
