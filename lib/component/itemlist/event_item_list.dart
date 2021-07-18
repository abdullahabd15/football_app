import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/api/resource.dart';
import 'package:football_app/bloc/event_league_bloc.dart';
import 'package:football_app/component/shimmer/event_shimmer.dart';
import 'package:football_app/component/shimmer/view_placeholder_shimmer.dart';
import 'package:football_app/event/football_request_event.dart';
import 'package:football_app/model/event.dart';
import 'package:football_app/model/league.dart';
import 'package:football_app/state/request_state.dart';
import 'package:football_app/utils/date_util.dart';

class EventItemList extends StatefulWidget {
  final League league;
  final Function(bool) loadingListener;

  const EventItemList({this.league, this.loadingListener});

  @override
  _EventItemListState createState() => _EventItemListState();
}

class _EventItemListState extends State<EventItemList>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocProvider(
      create: (BuildContext context) {
        return EventLeagueBloc(
            Resource<EventResponse>(state: RequestState.initial));
      },
      child: BlocBuilder<EventLeagueBloc, Resource<EventResponse>>(
        builder: (BuildContext context, state) {
          if (state.state == RequestState.initial) {
            var bloc = BlocProvider.of<EventLeagueBloc>(context);
            bloc.add(FindEventByLeagueEvent(leagueId: widget.league.idLeague));
            return Container();
          } else if (state.state == RequestState.onProgress) {
            widget.loadingListener.call(true);
            return EventShimmer();
          } else if (state.state == RequestState.requestSucceed) {
            widget.loadingListener.call(false);
            var events = state.data?.events ?? [];
            if (events.isEmpty) return Container();
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      widget.league.strLeague,
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                    ),
                  ),
                  ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      var event = events[index];
                      return _buildEvent(event);
                    },
                    itemCount: events.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            );
          } else {
            widget.loadingListener.call(false);
            return Container();
          }
        },
      ),
    );
  }

  Widget _buildEvent(Event event) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: event?.strTimestamp == null || event.strTimestamp.isEmpty
          ? Container()
          : Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildImageEvent(event),
                SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        DateUtil.convertToLocalFormat(event?.strTimestamp),
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Flexible(
                        child: Text(
                          event?.strEvent ?? "",
                          style: TextStyle(fontWeight: FontWeight.w800),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Status :"),
                          SizedBox(
                            width: 8,
                          ),
                          Expanded(
                            child: Text(
                              event?.strStatus ?? "",
                              style: TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildImageEvent(Event event) {
    return event?.strThumb == null || event.strThumb.isEmpty
        ? Container(
            height: 100,
            width: 150,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(5))),
          )
        : Container(
            width: 150,
            height: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Image.network(
                event.strThumb,
                loadingBuilder: (context, view, event) {
                  if (event == null) {
                    return view;
                  }
                  return ViewPlaceHolderShimmer(
                    width: 150,
                    height: 100,
                  );
                },
                fit: BoxFit.fill,
              ),
            ),
          );
  }

  @override
  bool get wantKeepAlive => true;
}
