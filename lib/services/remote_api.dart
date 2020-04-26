import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/model/post_short_info.dart';
import 'package:http/http.dart' as http;

String getBaseUrl() {
  if (kReleaseMode) {
    return "http://jobadda.company:1323/api";
  }
  return "http://jobadda.company:1323/api";
}

List<PostShortInfo> parsePosts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<PostShortInfo>((map) => PostShortInfo.fromMap(map))
      .toList();
}

Future<List<PostShortInfo>> getRecentPosts() async {
  final response = await http.get('${getBaseUrl()}/posts');
  if (response.statusCode == 200) {
    return compute(parsePosts, response.body);
  } else {
    throw Exception("Failed to get posts");
  }
}

Future<Post> getPostById(String id) async {
  final response = await http.get('${getBaseUrl()}/post/$id');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Post.fromMap(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load post');
  }
}

Future<List<PostShortInfo>> getPostsByType(String param) async {
  final response = await http.get('${getBaseUrl()}/posts?type=$param');
  return compute(parsePosts, response.body);
}

Future<List<PostShortInfo>> searchPosts(String query) async {
  final response = await http.get('${getBaseUrl()}/posts/search?q=$query');
  return compute(parsePosts, response.body);
}
