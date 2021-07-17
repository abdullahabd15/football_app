import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/api/resource.dart';
import 'package:football_app/bloc/countries_bloc.dart';
import 'package:football_app/bloc/leagues_bloc.dart';
import 'package:football_app/bloc/splash_bloc.dart';
import 'package:football_app/bloc/search_club_bloc.dart';
import 'package:football_app/model/country.dart';
import 'package:football_app/model/league.dart';
import 'package:football_app/model/team.dart';
import 'package:football_app/route/app_route.dart';
import 'package:football_app/screen/splash_screen.dart';
import 'package:football_app/event/football_request_event.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => SplashBloc(false),
      ),
      BlocProvider(
        create: (_) => CountriesBloc(
          Resource<CountriesResponse>(),
        ),
      ),
      BlocProvider(
        create: (_) => LeaguesBloc(
          Resource<LeagueResponse>(),
        ),
      ),
      BlocProvider(
        create: (_) => SearchClubBloc(
          Resource<TeamResponse>(),
        ),
      ),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => AppRoute.onGenerateRoute(settings),
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getData(context),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return SplashScreen();
      },
    );
  }

  Future<void> getData(BuildContext context) async {
    final countriesBloc = BlocProvider.of<CountriesBloc>(context);
    final leaguesBloc = BlocProvider.of<LeaguesBloc>(context);
    countriesBloc.add(FindAllCountriesEvent());
    leaguesBloc.add(FindAllLeaguesEvent());
  }
}
