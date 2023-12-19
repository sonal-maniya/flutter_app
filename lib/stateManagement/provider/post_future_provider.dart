// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

@immutable
class Post {
  final int id;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.title,
    required this.body,
  });

  Post copyWith({
    int? id,
    String? title,
    String? body,
  }) {
    return Post(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) =>
      Post.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Post(id: $id, title: $title, body: $body)';

  @override
  bool operator ==(covariant Post other) {
    if (identical(this, other)) return true;

    return other.id == id && other.title == title && other.body == body;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ body.hashCode;
}

class PostRepository {
  Future<Post> getPost() async {
    const postUrl = "https://jsonplaceholder.typicode.com/posts/1";
    return http
        .get(Uri.parse(postUrl))
        .then((value) => Post.fromJson(value.body));
  }
}

final postRepositoryProvider = Provider((ref) => PostRepository());
