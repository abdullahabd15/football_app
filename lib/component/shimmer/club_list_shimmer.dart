import 'package:flutter/material.dart';
import 'package:football_app/component/shimmer/circle_shimmer.dart';
import 'package:football_app/component/shimmer/club_shimmer.dart';
import 'package:football_app/component/shimmer/view_placeholder_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class ClubListShimmer extends StatelessWidget {
  const ClubListShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              ViewPlaceHolderShimmer(width: 200),
              SizedBox(height: 8,),
              ClubShimmer(),
              ClubShimmer(),
              ClubShimmer(),
              ClubShimmer(),
              ClubShimmer(),
              SizedBox(height: 8,),
              ViewPlaceHolderShimmer(width: 80),
              Divider(
                thickness: 1,
              ),
              SizedBox(
                height: 6,
              ),
            ],
          ),
        ),
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[200]);
  }
}
