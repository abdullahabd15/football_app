import 'package:flutter/material.dart';
import 'package:football_app/component/shimmer/view_placeholder_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class EventShimmer extends StatelessWidget {
  const EventShimmer();

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: Colors.grey[200],
      baseColor: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ViewPlaceHolderShimmer(
              width: 200,
              height: 18,
            ),
            SizedBox(
              height: 8,
            ),
            _buildEventShimmer(),
            _buildEventShimmer(),
            _buildEventShimmer(),
          ],
        ),
      ),
    );
  }

  Widget _buildEventShimmer() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ViewPlaceHolderShimmer(
            width: 150,
            height: 100,
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ViewPlaceHolderShimmer(width: 130),
                  SizedBox(
                    height: 3,
                  ),
                  ViewPlaceHolderShimmer(width: 150),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              ViewPlaceHolderShimmer(width: 100),
            ],
          ),
        ],
      ),
    );
  }
}
