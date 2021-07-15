import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/enum/splash_event.dart';

class SplashBloc extends Bloc<SplashEvent, bool> {

  SplashBloc(bool initialState) : super(initialState) {
    add(SplashEvent.loading);
  }

  @override
  Stream<bool> mapEventToState(SplashEvent event) async* {
    if (event == SplashEvent.loading) {
      await Future.delayed(Duration(milliseconds: 2000));
      add(SplashEvent.loadingDone);
    } else {
      yield true;
    }
  }
}