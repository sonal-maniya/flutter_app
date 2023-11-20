import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/constants/app_constants.dart';
import 'package:flutter_app/features/login/presentation/widgets/logo.dart';
import 'package:flutter_app/routes/routing.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InitialPageWidget extends StatefulWidget {
  const InitialPageWidget({super.key});

  @override
  State<InitialPageWidget> createState() => _InitialPageWidgetState();
}

class _InitialPageWidgetState extends State<InitialPageWidget> {
  @override
  void initState() {
    super.initState();
    whereToGo();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: AppLogoWidget(),
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
