import 'package:dio/dio.dart';

const String baseUrl = 'https://jsonplaceholder.typicode.com/';

class ApiDioClient {
  final _client = Dio();

  Map<String, String> get _headers {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  Future<dynamic> get(String path) async {
    try {
      final response = await _client.get('$baseUrl$path',
          options: Options(headers: _headers));
      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }
}
