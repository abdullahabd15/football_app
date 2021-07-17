import 'package:flutter/material.dart';
import 'package:football_app/component/shimmer/view_placeholder_shimmer.dart';

import 'circle_shimmer.dart';

class ClubShimmer extends StatelessWidget {
  const ClubShimmer();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          CircleShimmer(size: 30),
          SizedBox(width: 10,),
          ViewPlaceHolderShimmer(width: 300)
        ],
      ),
    );
  }
}
