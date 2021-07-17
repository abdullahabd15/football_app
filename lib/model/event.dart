class EventResponse {
  List<Event> events;

  EventResponse({this.events});

  EventResponse.fromMap(Map<String, dynamic> json) {
    if (json['events'] != null) {
      events = [];
      json['events'].forEach((v) {
        events.add(new Event.fromMap(v));
      });
    }
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.events != null) {
      data['events'] = this.events.map((v) => v.toMap()).toList();
    }
    return data;
  }
}

class Event {
  String idEvent;
  int idSoccerXML;
  String idAPIfootball;
  String strEvent;
  String strEventAlternate;
  String strFilename;
  String strSport;
  String idLeague;
  String strLeague;
  String strSeason;
  String strDescriptionEN;
  String strHomeTeam;
  String strAwayTeam;
  String intHomeScore;
  String intRound;
  String intAwayScore;
  int intSpectators;
  String strOfficial;
  String strHomeGoalDetails;
  String strHomeRedCards;
  String strHomeYellowCards;
  String strHomeLineupGoalkeeper;
  String strHomeLineupDefense;
  String strHomeLineupMidfield;
  String strHomeLineupForward;
  String strHomeLineupSubstitutes;
  String strHomeFormation;
  String strAwayRedCards;
  String strAwayYellowCards;
  String strAwayGoalDetails;
  String strAwayLineupGoalkeeper;
  String strAwayLineupDefense;
  String strAwayLineupMidfield;
  String strAwayLineupForward;
  String strAwayLineupSubstitutes;
  String strAwayFormation;
  int intHomeShots;
  int intAwayShots;
  String strTimestamp;
  String dateEvent;
  String dateEventLocal;
  String strTime;
  String strTimeLocal;
  String strTVStation;
  String idHomeTeam;
  String idAwayTeam;
  String strResult;
  String strVenue;
  String strCountry;
  String strCity;
  String strPoster;
  String strSquare;
  String strFanart;
  String strThumb;
  String strBanner;
  String strMap;
  String strTweet1;
  String strTweet2;
  String strTweet3;
  String strVideo;
  String strStatus;
  String strPostponed;
  String strLocked;

  Event(
      {this.idEvent,
      this.idSoccerXML,
      this.idAPIfootball,
      this.strEvent,
      this.strEventAlternate,
      this.strFilename,
      this.strSport,
      this.idLeague,
      this.strLeague,
      this.strSeason,
      this.strDescriptionEN,
      this.strHomeTeam,
      this.strAwayTeam,
      this.intHomeScore,
      this.intRound,
      this.intAwayScore,
      this.intSpectators,
      this.strOfficial,
      this.strHomeGoalDetails,
      this.strHomeRedCards,
      this.strHomeYellowCards,
      this.strHomeLineupGoalkeeper,
      this.strHomeLineupDefense,
      this.strHomeLineupMidfield,
      this.strHomeLineupForward,
      this.strHomeLineupSubstitutes,
      this.strHomeFormation,
      this.strAwayRedCards,
      this.strAwayYellowCards,
      this.strAwayGoalDetails,
      this.strAwayLineupGoalkeeper,
      this.strAwayLineupDefense,
      this.strAwayLineupMidfield,
      this.strAwayLineupForward,
      this.strAwayLineupSubstitutes,
      this.strAwayFormation,
      this.intHomeShots,
      this.intAwayShots,
      this.strTimestamp,
      this.dateEvent,
      this.dateEventLocal,
      this.strTime,
      this.strTimeLocal,
      this.strTVStation,
      this.idHomeTeam,
      this.idAwayTeam,
      this.strResult,
      this.strVenue,
      this.strCountry,
      this.strCity,
      this.strPoster,
      this.strSquare,
      this.strFanart,
      this.strThumb,
      this.strBanner,
      this.strMap,
      this.strTweet1,
      this.strTweet2,
      this.strTweet3,
      this.strVideo,
      this.strStatus,
      this.strPostponed,
      this.strLocked});

  Event.fromMap(Map<String, dynamic> json) {
    idEvent = json['idEvent'];
    idSoccerXML = json['idSoccerXML'];
    idAPIfootball = json['idAPIfootball'];
    strEvent = json['strEvent'];
    strEventAlternate = json['strEventAlternate'];
    strFilename = json['strFilename'];
    strSport = json['strSport'];
    idLeague = json['idLeague'];
    strLeague = json['strLeague'];
    strSeason = json['strSeason'];
    strDescriptionEN = json['strDescriptionEN'];
    strHomeTeam = json['strHomeTeam'];
    strAwayTeam = json['strAwayTeam'];
    intHomeScore = json['intHomeScore'];
    intRound = json['intRound'];
    intAwayScore = json['intAwayScore'];
    intSpectators = json['intSpectators'];
    strOfficial = json['strOfficial'];
    strHomeGoalDetails = json['strHomeGoalDetails'];
    strHomeRedCards = json['strHomeRedCards'];
    strHomeYellowCards = json['strHomeYellowCards'];
    strHomeLineupGoalkeeper = json['strHomeLineupGoalkeeper'];
    strHomeLineupDefense = json['strHomeLineupDefense'];
    strHomeLineupMidfield = json['strHomeLineupMidfield'];
    strHomeLineupForward = json['strHomeLineupForward'];
    strHomeLineupSubstitutes = json['strHomeLineupSubstitutes'];
    strHomeFormation = json['strHomeFormation'];
    strAwayRedCards = json['strAwayRedCards'];
    strAwayYellowCards = json['strAwayYellowCards'];
    strAwayGoalDetails = json['strAwayGoalDetails'];
    strAwayLineupGoalkeeper = json['strAwayLineupGoalkeeper'];
    strAwayLineupDefense = json['strAwayLineupDefense'];
    strAwayLineupMidfield = json['strAwayLineupMidfield'];
    strAwayLineupForward = json['strAwayLineupForward'];
    strAwayLineupSubstitutes = json['strAwayLineupSubstitutes'];
    strAwayFormation = json['strAwayFormation'];
    intHomeShots = json['intHomeShots'];
    intAwayShots = json['intAwayShots'];
    strTimestamp = json['strTimestamp'];
    dateEvent = json['dateEvent'];
    dateEventLocal = json['dateEventLocal'];
    strTime = json['strTime'];
    strTimeLocal = json['strTimeLocal'];
    strTVStation = json['strTVStation'];
    idHomeTeam = json['idHomeTeam'];
    idAwayTeam = json['idAwayTeam'];
    strResult = json['strResult'];
    strVenue = json['strVenue'];
    strCountry = json['strCountry'];
    strCity = json['strCity'];
    strPoster = json['strPoster'];
    strSquare = json['strSquare'];
    strFanart = json['strFanart'];
    strThumb = json['strThumb'];
    strBanner = json['strBanner'];
    strMap = json['strMap'];
    strTweet1 = json['strTweet1'];
    strTweet2 = json['strTweet2'];
    strTweet3 = json['strTweet3'];
    strVideo = json['strVideo'];
    strStatus = json['strStatus'];
    strPostponed = json['strPostponed'];
    strLocked = json['strLocked'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idEvent'] = this.idEvent;
    data['idSoccerXML'] = this.idSoccerXML;
    data['idAPIfootball'] = this.idAPIfootball;
    data['strEvent'] = this.strEvent;
    data['strEventAlternate'] = this.strEventAlternate;
    data['strFilename'] = this.strFilename;
    data['strSport'] = this.strSport;
    data['idLeague'] = this.idLeague;
    data['strLeague'] = this.strLeague;
    data['strSeason'] = this.strSeason;
    data['strDescriptionEN'] = this.strDescriptionEN;
    data['strHomeTeam'] = this.strHomeTeam;
    data['strAwayTeam'] = this.strAwayTeam;
    data['intHomeScore'] = this.intHomeScore;
    data['intRound'] = this.intRound;
    data['intAwayScore'] = this.intAwayScore;
    data['intSpectators'] = this.intSpectators;
    data['strOfficial'] = this.strOfficial;
    data['strHomeGoalDetails'] = this.strHomeGoalDetails;
    data['strHomeRedCards'] = this.strHomeRedCards;
    data['strHomeYellowCards'] = this.strHomeYellowCards;
    data['strHomeLineupGoalkeeper'] = this.strHomeLineupGoalkeeper;
    data['strHomeLineupDefense'] = this.strHomeLineupDefense;
    data['strHomeLineupMidfield'] = this.strHomeLineupMidfield;
    data['strHomeLineupForward'] = this.strHomeLineupForward;
    data['strHomeLineupSubstitutes'] = this.strHomeLineupSubstitutes;
    data['strHomeFormation'] = this.strHomeFormation;
    data['strAwayRedCards'] = this.strAwayRedCards;
    data['strAwayYellowCards'] = this.strAwayYellowCards;
    data['strAwayGoalDetails'] = this.strAwayGoalDetails;
    data['strAwayLineupGoalkeeper'] = this.strAwayLineupGoalkeeper;
    data['strAwayLineupDefense'] = this.strAwayLineupDefense;
    data['strAwayLineupMidfield'] = this.strAwayLineupMidfield;
    data['strAwayLineupForward'] = this.strAwayLineupForward;
    data['strAwayLineupSubstitutes'] = this.strAwayLineupSubstitutes;
    data['strAwayFormation'] = this.strAwayFormation;
    data['intHomeShots'] = this.intHomeShots;
    data['intAwayShots'] = this.intAwayShots;
    data['strTimestamp'] = this.strTimestamp;
    data['dateEvent'] = this.dateEvent;
    data['dateEventLocal'] = this.dateEventLocal;
    data['strTime'] = this.strTime;
    data['strTimeLocal'] = this.strTimeLocal;
    data['strTVStation'] = this.strTVStation;
    data['idHomeTeam'] = this.idHomeTeam;
    data['idAwayTeam'] = this.idAwayTeam;
    data['strResult'] = this.strResult;
    data['strVenue'] = this.strVenue;
    data['strCountry'] = this.strCountry;
    data['strCity'] = this.strCity;
    data['strPoster'] = this.strPoster;
    data['strSquare'] = this.strSquare;
    data['strFanart'] = this.strFanart;
    data['strThumb'] = this.strThumb;
    data['strBanner'] = this.strBanner;
    data['strMap'] = this.strMap;
    data['strTweet1'] = this.strTweet1;
    data['strTweet2'] = this.strTweet2;
    data['strTweet3'] = this.strTweet3;
    data['strVideo'] = this.strVideo;
    data['strStatus'] = this.strStatus;
    data['strPostponed'] = this.strPostponed;
    data['strLocked'] = this.strLocked;
    return data;
  }
}
