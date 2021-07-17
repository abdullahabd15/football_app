import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CircleShimmer extends StatelessWidget {
  final double size;

  const CircleShimmer({@required this.size});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          height: size,
          width: size,
          decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(size / 2))),
        ),
        baseColor: Colors.grey[300],
        highlightColor: Colors.grey[200]);
  }
}
