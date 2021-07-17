import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/api/resource.dart';
import 'package:football_app/model/event.dart';
import 'package:football_app/repository/football_repository.dart';
import 'package:football_app/event/football_request_event.dart';
import 'package:football_app/state/request_state.dart';

class EventLeagueBloc extends Bloc<FindEventByLeagueEvent, Resource<EventResponse>> {
  final _repository = FootballRepository();

  EventLeagueBloc(Resource<EventResponse> initialState) : super(initialState);

  @override
  Stream<Resource<EventResponse>> mapEventToState(FindEventByLeagueEvent event) async* {
    if (event is FindEventByLeagueEvent) {
      yield Resource(state: RequestState.onProgress);
      var leagueId = event.leagueId;
      var results = await _repository.findEventsByLeagueId(leagueId);
      yield results;
    }
  }
}