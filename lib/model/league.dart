class LeagueResponse {
  List<League> leagues;

  LeagueResponse({this.leagues});

  LeagueResponse.fromMap(Map<String, dynamic> json) {
    if (json['leagues'] != null) {
      leagues = [];
      json['leagues'].forEach((v) {
        var league = League.fromMap(v);
        if (league.strSport == 'Soccer') {
          leagues.add(league);
        }
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.leagues != null) {
      data['leagues'] = this.leagues.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

class League {
  String idLeague;
  String strLeague;
  String strSport;
  String strLeagueAlternate;
  bool isLoading;

  League(
      {this.idLeague,
      this.strLeague,
      this.strSport,
      this.strLeagueAlternate,
      this.isLoading});

  League.fromMap(Map<String, dynamic> json) {
    idLeague = json['idLeague'];
    strLeague = json['strLeague'];
    strSport = json['strSport'];
    strLeagueAlternate = json['strLeagueAlternate'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idLeague'] = this.idLeague;
    data['strLeague'] = this.strLeague;
    data['strSport'] = this.strSport;
    data['strLeagueAlternate'] = this.strLeagueAlternate;
    return data;
  }
}
