import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/api/resource.dart';
import 'package:football_app/model/team.dart';
import 'package:football_app/repository/football_repository.dart';
import 'package:football_app/event/football_request_event.dart';
import 'package:football_app/state/request_state.dart';

class SearchClubBloc extends Bloc<FindClubByNameEvent, Resource<TeamResponse>> {
  final _repository = FootballRepository();

  SearchClubBloc(Resource<TeamResponse> initialState) : super(initialState);

  @override
  Stream<Resource<TeamResponse>> mapEventToState(FindClubByNameEvent event) async* {
    if (event is FindClubByNameEvent) {
      yield Resource(state: RequestState.onProgress);
      var clubName = event.clubName;
      var results = await _repository.findFootballClubByName(clubName);
      yield results;
    }
  }
}