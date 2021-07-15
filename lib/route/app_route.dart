import 'package:flutter/material.dart';
import 'package:football_app/screen/main_screen.dart';
import 'package:football_app/screen/splash_screen.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case mainRoute:
        return MaterialPageRoute(builder: (context) => MainScreen());
      default:
        throw Exception("Not Found");
    }
  }
}