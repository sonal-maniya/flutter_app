import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/constants/app_constants.dart';
import 'package:flutter_app/routes/routing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialScreenWidget extends StatefulWidget {
  const InitialScreenWidget({super.key});

  @override
  State<InitialScreenWidget> createState() => _InitialScreenWidgetState();
}

class _InitialScreenWidgetState extends State<InitialScreenWidget> {
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/images/img_logo.png'),
        ),
      ),
    );
  }

  void whereToGo() async {
    var pref = await SharedPreferences.getInstance();
    var isLoggedIn = pref.getBool(AppConstants.keyIsLoggedIn);
    Timer(const Duration(seconds: 2), () {
      if (isLoggedIn != null && isLoggedIn) {
        Navigator.pushReplacementNamed(context, Routing.homePage);
      } else {
        Navigator.pushReplacementNamed(context, Routing.mainPage);
      }
    });
  }
}