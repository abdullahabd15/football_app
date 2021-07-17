import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ViewPlaceHolderShimmer extends StatelessWidget {
  final double width;
  final double height;
  const ViewPlaceHolderShimmer({@required this.width, this.height = 14});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300],
      highlightColor: Colors.grey[200],
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.all(
              Radius.circular(5)
          ),
        ),
      ),
    );
  }
}
