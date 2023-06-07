import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controlles/providers/loadjson_provider.dart';

class Splash_screen extends StatefulWidget {
  const Splash_screen({super.key});

  @override
  State<Splash_screen> createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  void initState() {
    loadJson();

    super.initState();
  }

  loadJson() async {
    Provider.of<LoadJsonProvider>(context, listen: false).loadJson();
  }
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 5),
      () {
        Navigator.of(context).pushReplacementNamed(
          '/',
        );
      },
    );
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/images/img.png",
            ),
          ),
        ),

      ),
    );
  }
}
