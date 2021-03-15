import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:jobadda/model/post.dart';
import 'package:jobadda/model/post_short_info.dart';
import 'package:http/http.dart' as http;

String getBaseUrl() {
  if (kReleaseMode) {
    return "https://api.sarkarijobadda.in";
  }
  return "http://localhost:1323";
}

final String token = "Bearer wA5dZ8J1U4mt7X2LFRy9W8337Sda1eAotmSID8dYHHdUfer3";

List<PostShortInfo> parsePosts(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<PostShortInfo>((map) => PostShortInfo.fromMap(map))
      .toList();
}

Future<List<PostShortInfo>> getRecentPosts() async {
  final response = await http.get(
    '${getBaseUrl()}/posts',
    headers: {HttpHeaders.authorizationHeader: token},
  );
  if (response.statusCode == 200) {
    return compute(parsePosts, response.body);
  } else {
    throw Exception("Failed to get posts");
  }
}

Future<Post> getPostById(String id) async {
  final response = await http.get(
    '${getBaseUrl()}/posts/$id',
    headers: {HttpHeaders.authorizationHeader: token},
  );

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
  final response = await http.get(
    '${getBaseUrl()}/posts?type=$param',
    headers: {HttpHeaders.authorizationHeader: token},
  );
  if (response.statusCode == 200) {
    return compute(parsePosts, response.body);
  } else {
    throw Exception("Failed to get posts");
  }
}

Future<List<PostShortInfo>> searchPosts(String query) async {
  final response = await http.get(
    '${getBaseUrl()}/posts/search?q=$query',
    headers: {HttpHeaders.authorizationHeader: token},
  );
  if (response.statusCode == 200) {
    return compute(parsePosts, response.body);
  } else {
    throw Exception("Failed to get posts");
  }
}
