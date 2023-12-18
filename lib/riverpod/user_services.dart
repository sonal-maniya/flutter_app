import 'package:flutter_app/modal/user_modal.dart';
import 'package:flutter_app/services/api.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserServices {
  final ApiClient apiClient = ApiClient();

  Future<List<UserModal>> getUser() async {
    try {
      dynamic responseData = await apiClient.get("users");
      final List result = responseData;
      return result.map((user) => UserModal.fromJson(user)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}

// injecting the class UserServices
// Provider hold the data
// userProvider is shared global instant
final userProvider = Provider<UserServices>((ref) => UserServices());

// final userString = Provider<String>((ref) => "Hello from RiverPod");
