import 'package:flutter/foundation.dart';

class CountryListModel {
  final String name;
  final String flag;
  final String iso2;
  final String iso3;

  CountryListModel(
      {required this.name,
      required this.flag,
      required this.iso2,
      required this.iso3});

  factory CountryListModel.fromJson(Map<String, dynamic> json) {
    return CountryListModel(
        name: json['name'],
        flag: json['flag'],
        iso2: json['iso2'],
        iso3: json['iso3']);
  }
}
