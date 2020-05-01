import 'package:flutter/material.dart';
import 'package:jobadda/analytics.dart';
import 'package:jobadda/home/home_post_list_tile.dart';
import 'package:jobadda/model/post_short_info.dart';
import 'package:jobadda/posts/post_tile_shimmer.dart';
import 'package:jobadda/services/remote_api.dart';

class PostSearchDelegate extends SearchDelegate {
  PostSearchDelegate() : super(searchFieldLabel: 'Search post..');

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
    if (query.isEmpty || query.length < 3)
      return Center(
        child: Text('Search posts...'),
      );
    analytics.logSearch(searchTerm: query);
    return getSearchResult(query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }

  Widget getSearchResult(String query) {
    return FutureBuilder(
      future: searchPosts(query),
      builder: (context, AsyncSnapshot<List<PostShortInfo>> snapshot) {
        if (snapshot.hasData) {
          var items = snapshot.data;
          if (items.length == 0) {
            return Center(
              child: Text('No match found...'),
            );
          }
          return ListView(
            children: items.map((e) => HomePostListTile(e)).toList(),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Some error occured :-<'),
          );
        } else {
          return ListView.builder(
              itemCount: 10, itemBuilder: (_, __) => PostTileShimmer());
        }
      },
    );
  }
}
