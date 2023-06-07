import 'dart:convert';

import 'package:animator_galaxy_planet/models/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/palnet_model.dart';

class ThemeAccessProvider extends ChangeNotifier {
  ThemeAccessModel themeAccessModel;

  ThemeAccessProvider({required this.themeAccessModel});

  Changetheme() async {
    themeAccessModel.isdark = !themeAccessModel.isdark;
    notifyListeners();

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    sharedPreferences.setBool('isdark', themeAccessModel.isdark);
  }
}


