import 'package:flutter_app/modal/album_modal.dart';
import 'package:flutter_app/services/api_using_dio.dart';

class PostDataManager {
  final ApiDioClient apiDioClient = ApiDioClient();

  Future<List<Album>> fetchPost() async {
    try {
      dynamic responseData = await apiDioClient.get('albums/1/photos');
      if (responseData is List) {
        List<Album> album = responseData
            .map((dynamic postJson) =>
                Album.fromJson(postJson as Map<String, dynamic>))
            .toList();
        return album;
      } else {
        throw Exception('Invalid response data format');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
