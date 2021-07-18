import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:football_app/api/resource.dart';
import 'package:football_app/bloc/leagues_bloc.dart';
import 'package:football_app/bloc/theme_bloc.dart';
import 'package:football_app/component/event_list.dart';
import 'package:football_app/event/theme_event.dart';
import 'package:football_app/model/league.dart';
import 'package:football_app/screen/search_screen.dart';
import 'package:football_app/state/request_state.dart';

const String mainRoute = "/mainRoute";

class MainScreen extends StatelessWidget {
  const MainScreen();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, bool>(
      builder: (BuildContext context, isLightTheme) {
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    var bloc = BlocProvider.of<ThemeBloc>(context);
                    if (!isLightTheme) {
                      bloc.add(SetLightTheme());
                    } else {
                      bloc.add(SetDarkTheme());
                    }
                  },
                    child: Icon(isLightTheme
                        ? Icons.nightlight_round
                        : Icons.wb_sunny)),
                SizedBox(
                  width: 15,
                ),
                Text("Football Event"),
              ],
            ),
            actions: [
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.search,
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, searchRoute);
                },
              )
            ],
          ),
          body: SafeArea(
            child: BlocBuilder<LeaguesBloc, Resource<LeagueResponse>>(
              builder: (BuildContext context, state) {
                if (state.state == RequestState.requestSucceed) {
                  return EventList(leagues: state.data.leagues);
                } else if (state.state == RequestState.onProgress) {
                  return SpinKitCircle(
                    size: 50,
                    color: Colors.blue,
                  );
                }
                return Container();
              },
            ),
          ),
        );
      },
    );
  }
}
