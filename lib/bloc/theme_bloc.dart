import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/event/theme_event.dart';
import 'package:football_app/utils/shared_preference_util.dart';

class ThemeBloc extends Bloc<AppTheme, bool> {

  ThemeBloc(bool initialState) : super(initialState) {
    add(GetTheme());
  }

  @override
  Stream<bool> mapEventToState(AppTheme event) async* {
    if (event is SetLightTheme) {
      SharedPreferenceUtil.setLightTheme(true);
      yield true;
    } else if (event is SetDarkTheme) {
      SharedPreferenceUtil.setLightTheme(false);
      yield false;
    } else if (event is GetTheme) {
      var isLightTheme = await SharedPreferenceUtil.isLightTheme();
      yield isLightTheme ?? true;
    }
  }
}