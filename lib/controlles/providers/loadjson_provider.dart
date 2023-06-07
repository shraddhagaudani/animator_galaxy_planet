import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../models/palnet_model.dart';

class LoadJsonProvider extends ChangeNotifier {
  String? data;
  List<Planets> planets = [];

  Future<void> loadJson() async {
    data = await rootBundle.loadString("assets/json/planets.json");

    List decodedlist = jsonDecode(data!);
    planets = decodedlist
        .map(
          (e) => Planets.fromMap(data: e),
        )
        .toList();
  }
}

class PopupmenuProvider extends ChangeNotifier {
  PopupmenuModel popupmenuModel = PopupmenuModel(
    initialpopupvalue: null,
  );

}

//
// class LoadJSON{
//
//   String? data;
//   List<Planets> planets = [];
//
//   Future<void>loadjson() async{
//     data = await rootBundle.loadString("assets/json/planets.json");
//
//     List decoded = jsonDecode(data!);
//
//     planets = decoded.map((e) => Planets.fromMap( data: e)).toList();
//
//   }
//
// }
