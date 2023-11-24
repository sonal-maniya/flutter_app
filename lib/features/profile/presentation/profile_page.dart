import 'package:flutter/material.dart';
import 'package:flutter_app/constants/app_constants.dart';
import 'package:flutter_app/features/login/presentation/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageWidget extends StatelessWidget {
  const ProfilePageWidget({super.key});

  Future<void> onLogout(context) async {
    var pref = await SharedPreferences.getInstance();
    await pref.remove(AppConstants.keyIsLoggedIn);
    await pref.remove(AppConstants.keyLoginUsername);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MainPageWidget()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(width: 1.0, color: Colors.redAccent),
          ),
          onPressed: () => onLogout(context),
          child: const Text(
            "Logout",
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
      ),
    );
  }
}
