import 'package:flutter/material.dart';
import 'package:football_app/model/team.dart';
import 'package:football_app/screen/club_detail_screen.dart';

import '../shimmer/circle_shimmer.dart';

class ClubItemList extends StatelessWidget {
  final Team team;

  const ClubItemList({this.team});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, clubDetailRoute, arguments: team);
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 2, bottom: 6),
        child: Row(
          children: [
            team.strTeamBadge != null
                ? Image.network(
                    team.strTeamBadge,
                    width: 30,
                    height: 30,
                    loadingBuilder: (context, widget, event) {
                      if (event == null) return widget;
                      return CircleShimmer(size: 30);
                    },
                  )
                : Container(),
            SizedBox(
              width: 10,
            ),
            Flexible(child: Text(team.strTeam)),
          ],
        ),
      ),
    );
  }
}
