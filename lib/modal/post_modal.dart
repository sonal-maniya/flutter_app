class Post {
  final int userId;
  final int id;
  final String title;
  final String description;

  const Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.description,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['body'] as String,
    );
  }

  factory Post.fromJson1(Map<String, dynamic> json) {
    return switch (json) {
      {
        'userId': int userId,
        'id': int id,
        'title': String title,
        'body': String description,
      } =>
        Post(userId: userId, id: id, title: title, description: description),
      _ => throw const FormatException('Failed to load post.'),
    };
  }
}
