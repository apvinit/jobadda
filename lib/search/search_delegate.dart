import 'package:flutter/material.dart';
import 'package:jobadda/home/home_post_list_tile.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/services/database.dart';

class PostSearchDelegate extends SearchDelegate {
  List<Post> posts;
  PostSearchDelegate() : super(searchFieldLabel: 'Search older post..') {
    Database().getRecentPosts().forEach((element) {
      posts = element;
    });
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      textTheme: theme.primaryTextTheme,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Widget> items = [];

    posts.forEach((element) {
      if (element.title.toLowerCase().contains(query.toLowerCase())) {
        items.add(HomePostListTile(element));
      }
    });

    if (items.length == 0) {
      return Center(
        child: Text('No match found...'),
      );
    }

    return ListView(
      children: items,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty)
      return Center(
        child: Text('Search older posts...'),
      );

    final List<Widget> items = [];

    posts.forEach((element) {
      if (element.title.toLowerCase().contains(query.toLowerCase())) {
        items.add(HomePostListTile(element));
      }
    });

    if (items.length == 0) {
      return Center(
        child: Text('No match found...'),
      );
    }

    return ListView(
      children: items,
    );
  }
}
