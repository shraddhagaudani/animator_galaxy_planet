import 'package:animator_galaxy_planet/controlles/providers/loadjson_provider.dart';
import 'package:animator_galaxy_planet/controlles/providers/theme_provider.dart';
import 'package:animator_galaxy_planet/models/theme_model.dart';
import 'package:animator_galaxy_planet/utills/app_utills.dart';
import 'package:animator_galaxy_planet/views/screens/details_page.dart';
import 'package:animator_galaxy_planet/views/screens/heart_page.dart';
import 'package:animator_galaxy_planet/views/screens/home_page.dart';
import 'package:animator_galaxy_planet/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  bool isdark = sharedPreferences.getBool('isdark') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThemeAccessProvider(
            themeAccessModel: ThemeAccessModel(
              isdark: isdark,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => LoadJsonProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PopupmenuProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Favrioute_Provider(),
        ),
      ],
      builder: (context, _) {
        return MaterialApp(
          initialRoute: 'Splash_screen',
          routes: {
            '/': (context) => const Homepage(),
            'Splash_screen': (context) => const Splash_screen(),
            'Details_page': (context) => const Details_page(),
            'Heart_page' : (context) => const Heart_page(),
          },
          theme: AppTheme.lighttheme,
          darkTheme: AppTheme.darktheme,
          themeMode: (Provider.of<ThemeAccessProvider>(context)
                      .themeAccessModel
                      .isdark ==
                  false)
              ? ThemeMode.light
              : ThemeMode.dark,
          debugShowCheckedModeBanner: false,
        );
      },
    ),
  );
}
