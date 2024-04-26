// TypiCodeModel class
class TypiCodeModel {
  late int id;
  late String name;
  late String userName;
  late String email;
  Address? address;

  TypiCodeModel(
      {required this.id,
      required this.name,
      required this.userName,
      required this.email,
      this.address});

  factory TypiCodeModel.fromJson(Map<String, dynamic> json) {
    return TypiCodeModel(
        id: json['id'],
        name: json['name'],
        userName: json['username'],
        email: json['email'],
        address: Address.fromJson(json['address']));
  }
}

// address model class
class Address {
  late String street;
  late String suite;
  late String city;
  late String zipecode;
  Geo? geo;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipecode,
      this.geo});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        street: json['street'],
        suite: json['suite'],
        city: json['city'],
        zipecode: json['zipcode'],
        geo: Geo.fromJson(json['geo']));
  }
}

// Geo class

class Geo {
  late String lat;
  late String long;

  Geo({required this.lat, required this.long});

  factory Geo.fromJson(Map<String, dynamic> json) {
    return Geo(lat: json['lat'], long: json['lng']);
  }
}
