import 'package:flutter/material.dart';
import 'package:flutter_app/constants/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;
  String _userName = '';

  bool get isLoading => _isLoading;

  String get userName => _userName;

  void setIsLoading(bool flag) {
    _isLoading = flag;
  }

  Future<bool> login(String username, String password) async {
    try {
      setIsLoading(true);
      if (username.isNotEmpty && password.isNotEmpty) {
        final SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setString(AppConstants.keyLoginUsername, username);
        await pref.setBool(AppConstants.keyIsLoggedIn, true);
        _userName = username;
        return true;
      }
    } catch (e) {
      print(e.toString());
    } finally {
      setIsLoading(false);
    }
    return false;
  }
}
