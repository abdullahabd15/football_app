import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function(String) textChangeListener;
  final Function(String) searchListener;

  const SearchBar({this.textChangeListener, this.searchListener});

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _searchController = TextEditingController();

  @override
  void initState() {
    _searchController.addListener(() {
      widget.textChangeListener?.call(_searchController.text);
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: _searchController,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _searchController.text.isNotEmpty
                  ? InkWell(
                    onTap: () => _searchController.clear(),
                    child: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                  )
                  : Container(),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () => widget.searchListener.call(_searchController.text),
                child: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Search Football Club...",
          hintStyle: TextStyle(color: Colors.grey[300])
        ),
      ),
    );
  }
}
