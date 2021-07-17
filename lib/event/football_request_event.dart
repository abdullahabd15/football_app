import 'package:flutter/material.dart';

class FindAllCountriesEvent {
  FindAllCountriesEvent();
}

class FindAllLeaguesEvent {
  FindAllLeaguesEvent();
}

class FindClubByCountryEvent {
  final String countryName;
  FindClubByCountryEvent({@required this.countryName});
}

class FindEventByLeagueEvent {
  final String leagueId;
  FindEventByLeagueEvent({@required this.leagueId});
}

class FindClubByNameEvent {
  final String clubName;
  FindClubByNameEvent({@required this.clubName});
}



