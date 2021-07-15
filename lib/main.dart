import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/bloc/splash_bloc.dart';
import 'package:football_app/route/app_route.dart';
import 'package:football_app/screen/splash_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => SplashBloc(false)),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      onGenerateRoute: (settings) => AppRoute.onGenerateRoute(settings),
    ),
  ));
}
