import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/api/resource.dart';
import 'package:football_app/bloc/countries_bloc.dart';
import 'package:football_app/bloc/search_club_bloc.dart';
import 'package:football_app/component/itemlist/club_item_list.dart';
import 'package:football_app/component/shimmer/club_shimmer.dart';
import 'package:football_app/component/country_list.dart';
import 'package:football_app/component/search_bar.dart';
import 'package:football_app/model/country.dart';
import 'package:football_app/model/team.dart';
import 'package:football_app/event/football_request_event.dart';
import 'package:football_app/state/request_state.dart';

const String searchRoute = "/searchRoute";

class SearchScreen extends StatefulWidget {
  const SearchScreen();

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var isFirstInitialize = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          searchListener: (query) {
            var bloc = BlocProvider.of<SearchClubBloc>(context);
            bloc.add(FindClubByNameEvent(clubName: query));
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: _buildClubSearchResults(),
        ),
      ),
    );
  }

  Widget _buildClubSearchResults() {
    return BlocBuilder<SearchClubBloc, Resource<TeamResponse>>(
      builder: (context, state) {
        if (isFirstInitialize) {
          isFirstInitialize = false;
          return _buildCountryList();
        } else if (state.state == RequestState.onProgress) {
          return Padding(
            padding: const EdgeInsets.only(top: 8),
            child: ListView.builder(
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ClubShimmer(),
                );
              },
              itemCount: 5,
            ),
          );
        } else if (state.state == RequestState.requestSucceed) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 8),
                child: ClubItemList(
                  team: state.data.teams[index],
                ),
              );
            },
            itemCount: state.data.teams.length,
          );
        } else {
          return Container();
        }
      },
    );
  }

  Widget _buildCountryList() {
    return BlocBuilder<CountriesBloc, Resource<CountriesResponse>>(
      builder: (BuildContext context, state) {
        if (state?.state == RequestState.requestSucceed) {
          final countries = state.data?.countries ?? [];
          return countries.isNotEmpty
              ? CountryList(
                  countries: countries,
                )
              : Container();
        } else {
          return Container();
        }
      },
    );
  }
}
