import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PostTileShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Shimmer.fromColors(
            child:
                Container(color: Colors.black26, padding: EdgeInsets.all(8.0)),
            baseColor: Colors.black12,
            highlightColor: Colors.black26),
      ),
    );
  }
}
