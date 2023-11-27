import 'package:flutter_app/services/api.dart';
import 'package:flutter_app/modal/post_modal.dart';

class ListDataManager {
  final ApiClient apiClient = ApiClient();

  Future<List<Post>> fetchPost() async {
    try {
      dynamic responseData = await apiClient.get('posts');
      List<Post> posts = (responseData as List<dynamic>)
          .map((dynamic postJson) =>
              Post.fromJson(postJson as Map<String, dynamic>))
          .toList();
      return posts;
    } catch (e) {
      throw Exception(e);
    } finally {
      apiClient.close();
    }
  }
}
