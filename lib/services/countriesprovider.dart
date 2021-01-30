import 'dart:collection';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/country.dart';
import 'package:http/http.dart' as http;

class CountriesProvider with ChangeNotifier {
  CountriesProvider() {
    this.fetchData();
  }
  List<Countries> _data = [];
  List<Countries> get data => _data;
  Future fetchData() async {
    var response = await http.get("https://restcountries.eu/rest/v2/all");
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body) as List;
      _data = data.map((json) => Countries.fromJson(json)).toList();
      notifyListeners();
    }
  }

  String _search = "";
  UnmodifiableListView<Countries> get countries => _search.isEmpty
      ? UnmodifiableListView(_data)
      : UnmodifiableListView(_data.where((element) =>
          element.country.toLowerCase().contains(_search) ||
          element.abbreviation.toLowerCase().contains(_search)));

  void changeSearchString(String search) {
    _search = search;

    notifyListeners();
  }
}
