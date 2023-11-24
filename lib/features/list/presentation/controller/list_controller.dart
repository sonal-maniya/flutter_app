import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_app/modal/post_modal.dart';

Future<List<Post>> fetchPost() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
  );
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    List<dynamic> jsonResponse = jsonDecode(response.body);
    List<Post> posts = jsonResponse
        .map((postJson) => Post.fromJson(postJson as Map<String, dynamic>))
        .toList();
    return posts;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
