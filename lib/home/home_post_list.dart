import 'package:flutter/material.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/posts/post_tile_shimmer.dart';
import 'package:jobadda/services/database.dart';

import 'home_post_list_tile.dart';

class HomePostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Database().getRecentPosts(),
      builder: (context, AsyncSnapshot<List<Post>> snapshot) {
        if (snapshot.hasData) {
          var posts = snapshot.data;
          return ListView(
              children: posts.map((post) => HomePostListTile(post)).toList());
        } else {
          return ListView.builder(
              itemCount: 15, itemBuilder: (_, __) => PostTileShimmer());
        }
      },
    );
  }
}
