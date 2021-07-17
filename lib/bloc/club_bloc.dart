import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/api/resource.dart';
import 'package:football_app/model/team.dart';
import 'package:football_app/repository/football_repository.dart';
import 'package:football_app/event/football_request_event.dart';
import 'package:football_app/state/request_state.dart';

class ClubBloc extends Bloc<FindClubByCountryEvent, Resource<TeamResponse>> {
  final _repository = FootballRepository();

  ClubBloc(Resource<TeamResponse> initialState) : super(initialState);

  @override
  Stream<Resource<TeamResponse>> mapEventToState(FindClubByCountryEvent event) async* {
    if (event is FindClubByCountryEvent) {
      yield Resource(state: RequestState.onProgress);
      var countryName = event.countryName;
      var results = await _repository.findFootballClubByCountry(countryName);
      if (results.data?.teams != null) {
        yield results;
      } else {
        yield Resource(state: RequestState.requestFailed, errorMessage: state.errorMessage);
      }
    }
  }
}