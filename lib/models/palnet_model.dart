import 'package:flutter/material.dart';

class Planets {
  String name;
  String color;
  String details;
  String image;

  Planets(
      {required this.name,
      required this.color,
      required this.details,
      required this.image});

  factory Planets.fromMap({required Map data}) {
    return Planets(
      name: data['name'],
      color: data['color'],
      details: data['details'],
      image: data['image'],
    );
  }
}


class PopupmenuModel{
  String? initialpopupvalue;

  PopupmenuModel({required this.initialpopupvalue});
}