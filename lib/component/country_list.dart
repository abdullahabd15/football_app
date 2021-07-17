import 'package:flutter/material.dart';
import 'package:football_app/model/country.dart';

import 'itemlist/country_item_list.dart';

class CountryList extends StatefulWidget {
  final List<Country> countries;

  const CountryList({this.countries});

  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
  final _scrollController = ScrollController();
  final _itemCountPerPage = 7;
  var _itemCount = 7;
  var _currentPage = 1;
  var _totalPage = 1;

  @override
  void initState() {
    _totalPage = (widget.countries.length / _itemCount).ceil();
    _scrollController.addListener(() {
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          _currentPage < _totalPage && !_isItemListStillLoading()) {
        setState(() {
          _currentPage++;
          if (_totalPage == _currentPage) {
            _itemCount = widget.countries.length;
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
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return CountryItemList(
          country: widget.countries[index],
          loadingListener: (isLoading) {
            widget.countries[index].isLoading = isLoading;
          },
        );
      },
      controller: _scrollController,
      itemCount: _itemCount,
    );
  }

  bool _isItemListStillLoading() {
    return widget.countries.any((element) => element.isLoading == true);
  }
}
