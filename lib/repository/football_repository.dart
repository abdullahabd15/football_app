import 'dart:core';

import 'package:football_app/api/api_client.dart';
import 'package:football_app/api/resource.dart';
import 'package:football_app/constant/constants.dart';
import 'package:football_app/model/country.dart';
import 'package:football_app/model/event.dart';
import 'package:football_app/model/league.dart';
import 'package:football_app/model/team.dart';
import 'package:football_app/state/request_state.dart';

class FootballRepository {
  final _api = ApiClient();

  Future<Resource<CountriesResponse>> findAllCountries() async {
    try {
      var result = await _api.get(Constants.urlAllCountries);
      if (result.data != null) {
        return Resource<CountriesResponse>(data: CountriesResponse.fromMap(result.data),
            state: RequestState.requestSucceed);
      } else {
        return Resource<CountriesResponse>(errorMessage: result.errorMessage,
            state: RequestState.requestFailed);
      }
    } catch (e) {
      return Resource<CountriesResponse>(
          errorMessage: e?.toString() ?? Constants.unknownErrorMessage,
          state: RequestState.requestFailed);
    }
  }

  Future<Resource<LeagueResponse>> findAllLeagues() async {
    try {
      var result = await _api.get(Constants.urlAllLeagues);
      if (result.data != null) {
        return Resource(data: LeagueResponse.fromMap(result.data),
            state: RequestState.requestSucceed);
      } else {
        return Resource(errorMessage: result.errorMessage,
            state: RequestState.requestFailed);
      }
    } catch (e) {
      return Resource(
          errorMessage: e?.toString() ?? Constants.unknownErrorMessage,
          state: RequestState.requestFailed);
    }
  }

  Future<Resource<TeamResponse>> findFootballClubByCountry(String countryName) async {
    try {
      var result = await _api.get("${Constants.urlClubByCountry}&c=$countryName");
      if (result.data != null) {
        return Resource(data: TeamResponse.fromMap(result.data),
            state: RequestState.requestSucceed);
      } else {
        return Resource(errorMessage: result.errorMessage,
            state: RequestState.requestFailed);
      }
    } catch (e) {
      return Resource(
          errorMessage: e?.toString() ?? Constants.unknownErrorMessage,
          state: RequestState.requestFailed);
    }
  }

  Future<Resource<EventResponse>> findEventsByLeagueId(String leagueId) async {
    try {
      var result = await _api.get("${Constants.urlEventByLeagueId}?id=$leagueId");
      if (result.data != null) {
        return Resource(data: EventResponse.fromMap(result.data),
            state: RequestState.requestSucceed);
      } else {
        return Resource(errorMessage: result.errorMessage,
            state: RequestState.requestFailed);
      }
    } catch (e) {
      return Resource(
          errorMessage: e?.toString() ?? Constants.unknownErrorMessage,
          state: RequestState.requestFailed);
    }
  }

  Future<Resource<TeamResponse>> findFootballClubByName(String clubName) async {
    try {
      var result = await _api.get("${Constants.urlClubByName}?t=$clubName");
      if (result.data != null) {
        return Resource(data: TeamResponse.fromMap(result.data),
            state: RequestState.requestSucceed);
      } else {
        return Resource(errorMessage: result.errorMessage,
            state: RequestState.requestFailed);
      }
    } catch (e) {
      return Resource(
          errorMessage: e?.toString() ?? Constants.unknownErrorMessage,
          state: RequestState.requestFailed);
    }
  }
}