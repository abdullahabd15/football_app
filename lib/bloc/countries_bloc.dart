import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/api/resource.dart';
import 'package:football_app/model/country.dart';
import 'package:football_app/repository/football_repository.dart';
import 'package:football_app/event/football_request_event.dart';
import 'package:football_app/state/request_state.dart';

class CountriesBloc extends Bloc<FindAllCountriesEvent, Resource<CountriesResponse>> {
  final _repository = FootballRepository();

  CountriesBloc(Resource<CountriesResponse> initialState) : super(initialState);

  @override
  Stream<Resource<CountriesResponse>> mapEventToState(FindAllCountriesEvent event) async* {
    yield Resource<CountriesResponse>(state: RequestState.onProgress);
    var results = await _repository.findAllCountries();
    yield results;
  }
}