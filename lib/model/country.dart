import 'package:flutter_app/model/currencies.dart';
import 'package:flutter_app/model/languages.dart';

class Countries {
  String country;
  String flag;
  List<String> borders;
  String capital;
  int population;
  String region;
  List<Languages> languages;
  List<Currencies> currencies;
  List<double> latlng;
  List<String> codes;
  String abbreviation;
  Countries(
      {this.country,
      this.flag,
      this.borders,
      this.capital,
      this.population,
      this.region,
      this.languages,
      this.currencies,
      this.codes,
      this.latlng,
      this.abbreviation});
  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
      country: json['name'],
      flag: json['flag'],
      borders: List<String>.from(json['borders'].map((x) => x)),
      capital: json['capital'],
      population: json['population'],
      region: json['region'],
      languages: List<Languages>.from(
          json['languages'].map((x) => Languages.fromJson(x))),
      currencies: List<Currencies>.from(
          json['currencies'].map((x) => Currencies.fromJson(x))),
      codes: List<String>.from(json['callingCodes'].map((x) => x)),
      latlng: List<double>.from(json["latlng"].map((x) => x.toDouble())),
      abbreviation: json['alpha2Code']);
}
