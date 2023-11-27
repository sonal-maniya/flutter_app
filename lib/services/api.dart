import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = 'https://jsonplaceholder.typicode.com/';

class ApiClient {
  final http.Client _client = http.Client();

  Map<String, String> get _headers {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  Future<dynamic> get(String path) async {
    try {
      final uri = Uri.parse('$baseUrl$path');
      final response = await _client.get(uri, headers: _headers);

      final dynamic jsonResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return jsonResponse;
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load data: $e');
    }
  }

  void close() {
    _client.close();
  }
}
