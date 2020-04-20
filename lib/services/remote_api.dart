import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/model/post_short_info.dart';
import 'package:http/http.dart' as http;

final String baseUrl = "http://127.0.0.1:3000";

List<PostShortInfo> parsePosts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<PostShortInfo>((map) => PostShortInfo.fromMap(map))
      .toList();
}

Future<List<PostShortInfo>> getRecentPosts() async {
  final response = await http.get('$baseUrl/posts_info');
  return compute(parsePosts, response.body);
}

Future<Post> getPostById(String id) async {
  final response = await http.get('$baseUrl/posts/$id');

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
  final response = await http.get('$baseUrl/posts_info?type=$param');
  return compute(parsePosts, response.body);
}

Future<List<PostShortInfo>> searchPosts(String query) async {
  final response = await http.get('$baseUrl/posts_info?=$query');
  return compute(parsePosts, response.body);
}
