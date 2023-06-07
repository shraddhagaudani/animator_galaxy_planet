import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/palnet_model.dart';

class LoadJsonProvider extends ChangeNotifier {
  String? data;
  List<Planets_Model> planets = [];

  Future<void> loadJson() async {
    data = await rootBundle.loadString("assets/json/planets.json");

    List decodedlist = jsonDecode(data!);
    planets = decodedlist
        .map(
          (e) => Planets_Model.fromMap(data: e),
        )
        .toList();
  }
}

class PopupmenuProvider extends ChangeNotifier {
  PopupmenuModel popupmenuModel = PopupmenuModel(
    initialpopupvalue: null,
  );
}

class Favrioute_Provider extends ChangeNotifier {
  List<Planets_Model> favrioute = [];

  addfavrioute({required Planets_Model added}) async {
    favrioute.add(added);
    notifyListeners();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setStringList('favrioute', favrioute.cast<String>(),);
  }
}

class SavedetailsProvider {
  Planets_Model planets_model;

  SavedetailsProvider({required this.planets_model});
}

