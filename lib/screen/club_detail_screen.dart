import 'package:flutter/material.dart';
import 'package:football_app/component/shimmer/view_placeholder_shimmer.dart';
import 'package:football_app/model/team.dart';

const String clubDetailRoute = "/clubDetailRoute";

class ClubDetailScreen extends StatelessWidget {
  final Team team;

  const ClubDetailScreen({this.team});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.network(
                    team?.strTeamBadge,
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Flexible(
                      child: Text(
                    team?.strTeam,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  )),
                ],
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 3,
              ),
              team?.strDescriptionEN == null
                  ? Container()
                  : Flexible(
                      child: Text(
                        team?.strDescriptionEN,
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Leagues",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              _buildLeagueList(team),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("Informed Year :"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    team?.intFormedYear ?? "-",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text("Country :"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    team?.strCountry ?? "-",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("Stadium :"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    team?.strStadium ?? "-",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text("Stadium Location :"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    team?.strStadiumLocation ?? "-",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text("Stadium Capacity :"),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    team?.intStadiumCapacity ?? "-",
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              team?.strStadiumDescription == null
                  ? Container()
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description :",
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          team?.strStadiumDescription ?? "-",
                        ),
                      ],
                    ),
              SizedBox(
                height: 8,
              ),
              team?.strStadiumThumb == null || team.strStadiumThumb.isEmpty
                  ? Container()
                  : ClipRRect(
                      child: Image.network(
                        team?.strStadiumThumb,
                        width: double.infinity,
                        loadingBuilder: (context, view, event) {
                          if (event == null) {
                            return view;
                          }
                          return ViewPlaceHolderShimmer(width: double.infinity, height: 180,);
                        },
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeagueList(Team team) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        team?.strLeague == null || team.strLeague.isEmpty
            ? Container()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text(team.strLeague),
              ),
        team?.strLeague2 == null || team.strLeague2.isEmpty
            ? Container()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text(team.strLeague2),
              ),
        team?.strLeague3 == null || team.strLeague3.isEmpty
            ? Container()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text(team.strLeague3),
              ),
        team?.strLeague4 == null || team.strLeague4.isEmpty
            ? Container()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text(team.strLeague4),
              ),
        team?.strLeague5 == null || team.strLeague5.isEmpty
            ? Container()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text(team.strLeague5),
              ),
        team?.strLeague6 == null || team.strLeague6.isEmpty
            ? Container()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text(team.strLeague6),
              ),
        team?.strLeague7 == null || team.strLeague7.isEmpty
            ? Container()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Text(team.strLeague7),
              ),
      ],
    );
  }
}
