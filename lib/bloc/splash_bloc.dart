import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/event/splash_event.dart';

class SplashBloc extends Bloc<SplashEvent, bool> {

  SplashBloc(bool initialState) : super(initialState) {
    add(SplashEvent.loading);
  }

  @override
  Stream<bool> mapEventToState(SplashEvent event) async* {
    if (event == SplashEvent.loading) {
      await Future.delayed(Duration(milliseconds: 500));
      add(SplashEvent.loadingDone);
    } else {
      yield true;
    }
  }
}