import 'package:flutter/material.dart';
import 'package:jobadda/post_item_tile.dart';

class PostListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Results')),
      body: ListView.builder(
        itemCount: 30,
        itemBuilder: (context, int) {
          return PostItemTile();
        },
      ),
    );
  }
}
