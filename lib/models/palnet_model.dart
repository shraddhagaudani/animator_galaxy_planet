import 'package:flutter/material.dart';

class Planets_Model {
  String name;
  String color;
  String details;
  String image;
  bool  favrioute;

  Planets_Model(
      {required this.name,
      required this.color,
      required this.details,
      required this.image,
      required this.favrioute});

  factory Planets_Model.fromMap({required Map data}) {
    return Planets_Model(
      name: data['name'],
      color: data['color'],
      details: data['details'],
      image: data['image'],
      favrioute: data['favrioute']
    );
  }
}


class PopupmenuModel{
  String? initialpopupvalue;

  PopupmenuModel({required this.initialpopupvalue});
}