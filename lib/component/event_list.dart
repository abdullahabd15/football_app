import 'package:flutter/material.dart';
import 'package:football_app/component/itemlist/event_item_list.dart';
import 'package:football_app/model/league.dart';

class EventList extends StatefulWidget {
  final List<League> leagues;

  const EventList({this.leagues});

  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  final _scrollController = ScrollController();
  final _itemCountPerPage = 7;
  var _itemCount = 7;
  var _currentPage = 1;
  var _totalPage = 1;

  @override
  void initState() {
    _totalPage = (widget.leagues.length / _itemCount).ceil();
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          _currentPage < _totalPage &&
          !_isItemListStillLoading()) {
        setState(() {
          _currentPage++;
          if (_totalPage == _currentPage) {
            _itemCount = widget.leagues.length;
          } else {
            _itemCount += _itemCountPerPage;
          }
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return EventItemList(
            league: widget.leagues[index],
            loadingListener: (isLoading) {
              widget.leagues[index].isLoading = isLoading;
            },
          );
        },
        itemCount: _itemCount,
        controller: _scrollController,
      ),
    );
  }

  bool _isItemListStillLoading() {
    return widget.leagues.any((element) => element.isLoading == true);
  }
}
