import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class PostDetailShimmer extends StatelessWidget {
  const PostDetailShimmer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading...'),
      ),
      body: Shimmer.fromColors(
        highlightColor: Colors.grey[100],
        baseColor: Colors.grey[300],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 18,
                width: 240,
                color: Colors.grey,
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(16.0),
                height: 18,
                color: Colors.grey,
              ),
              SizedBox(height: 18),
              Container(
                height: 18,
                width: 240,
                color: Colors.grey,
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(16.0),
                height: 18,
                color: Colors.grey,
              ),
              SizedBox(height: 18),
              Container(
                height: 18,
                width: 240,
                color: Colors.grey,
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(16.0),
                height: 18,
                color: Colors.grey,
              ),
              SizedBox(height: 18),
              Container(
                height: 18,
                width: 240,
                color: Colors.grey,
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.all(16.0),
                height: 18,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
