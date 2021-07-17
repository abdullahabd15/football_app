import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/api/resource.dart';
import 'package:football_app/model/league.dart';
import 'package:football_app/repository/football_repository.dart';
import 'package:football_app/event/football_request_event.dart';
import 'package:football_app/state/request_state.dart';

class LeaguesBloc extends Bloc<FindAllLeaguesEvent, Resource<LeagueResponse>> {
  final _repository = FootballRepository();

  LeaguesBloc(Resource initialState) : super(initialState);

  @override
  Stream<Resource<LeagueResponse>> mapEventToState(FindAllLeaguesEvent event) async* {
    yield Resource(state: RequestState.onProgress);
    var results = await _repository.findAllLeagues();
    yield results;
  }
}