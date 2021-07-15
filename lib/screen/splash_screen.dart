import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/bloc/splash_bloc.dart';
import 'package:football_app/screen/main_screen.dart';

const String splashRoute = "/splashRoute";

class SplashScreen extends StatelessWidget {
  const SplashScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashBloc, bool>(
        listener: (context, isLoadingDone) {
          if (isLoadingDone) {
            Navigator.pushReplacementNamed(context, mainRoute);
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/soccer_loading.gif"),
              SizedBox(height: 10,),
              Text(
                "Football App",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
