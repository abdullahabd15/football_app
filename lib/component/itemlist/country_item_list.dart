import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/api/resource.dart';
import 'package:football_app/bloc/club_bloc.dart';
import 'package:football_app/component/itemlist/club_item_list.dart';
import 'package:football_app/component/shimmer/club_list_shimmer.dart';
import 'package:football_app/model/country.dart';
import 'package:football_app/model/team.dart';
import 'package:football_app/event/football_request_event.dart';
import 'package:football_app/state/request_state.dart';

class CountryItemList extends StatefulWidget {
  final Country country;
  final Function(bool) loadingListener;

  const CountryItemList({this.country, this.loadingListener});

  @override
  _CountryItemListState createState() => _CountryItemListState();
}

class _CountryItemListState extends State<CountryItemList>
    with AutomaticKeepAliveClientMixin {
  bool seeMore = false;
  bool hideSeeMore = false;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (BuildContext context) => ClubBloc(
        Resource<TeamResponse>(state: RequestState.initial),
      ),
      child: BlocBuilder<ClubBloc, Resource<TeamResponse>>(
        builder: (context, state) {
          if (state.state == RequestState.initial) {
            var bloc = BlocProvider.of<ClubBloc>(context);
            bloc.add(
                FindClubByCountryEvent(countryName: widget.country.nameEn));
            return Container();
          } else if (state.state == RequestState.onProgress) {
            widget.loadingListener.call(true);
            return ClubListShimmer();
          } else if (state.state == RequestState.requestSucceed) {
            widget.loadingListener.call(false);
            var teams = state.data.teams;
            hideSeeMore = teams.length < 6;
            var clubList = hideSeeMore
                ? teams
                : seeMore
                    ? teams
                    : teams.sublist(0, 5);
            return _buildClubList(clubList);
          } else {
            widget.loadingListener.call(false);
            return Container();
          }
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Widget _buildClubList(List<Team> clubList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 8,
        ),
        Text(
          "${widget.country.nameEn} :",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
        SizedBox(
          height: 8,
        ),
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var club = clubList[index];
              return ClubItemList(team: club);
            },
            itemCount: clubList.length,
            addAutomaticKeepAlives: true,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
        hideSeeMore
            ? Container()
            : InkWell(
                onTap: () {
                  setState(() {
                    seeMore = !seeMore;
                  });
                },
                child: Text(
                  seeMore ? "See less.." : "See more...",
                  style: TextStyle(
                    color: Colors.blue[700],
                    fontWeight: FontWeight.w700,
                  ),
                )),
        Divider(
          thickness: 1,
        ),
        SizedBox(
          height: 2,
        ),
      ],
    );
  }
}
