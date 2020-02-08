import 'package:flutter/material.dart';

class PostItemTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('UPSSC 2019 Results', style: TextStyle(fontSize: 16.0),),
        ),
      ),
    );
  }
}
