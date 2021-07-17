import 'package:flutter/material.dart';
import 'package:football_app/model/team.dart';
import 'package:football_app/screen/club_detail_screen.dart';
import 'package:football_app/screen/main_screen.dart';
import 'package:football_app/screen/search_screen.dart';
import 'package:football_app/screen/splash_screen.dart';

class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (context) => SplashScreen());
      case mainRoute:
        return MaterialPageRoute(builder: (context) => MainScreen());
      case searchRoute:
        return MaterialPageRoute(builder: (context) => SearchScreen());
      case clubDetailRoute:
        var team = settings.arguments as Team;
        return MaterialPageRoute(
          builder: (context) => ClubDetailScreen(
            team: team,
          ),
        );
      default:
        throw Exception("Not Found");
    }
  }
}
