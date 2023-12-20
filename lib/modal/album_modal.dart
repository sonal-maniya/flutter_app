class Album {
  final int albumId;
  final int id;
  final String title;
  final String url;

  const Album({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
    );
  }

  factory Album.fromJson1(Map<String, dynamic> json) {
    return switch (json) {
      {
        'albumId': int albumId,
        'id': int id,
        'title': String title,
        'url': String url,
      } =>
        Album(albumId: albumId, id: id, title: title, url: url),
      _ => throw const FormatException('Failed to load Album.'),
    };
  }
}
