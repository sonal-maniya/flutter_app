import 'package:flutter/material.dart';
import 'package:flutter_app/constants/route_constants.dart';
import 'package:flutter_app/features/feed/presentation/home_page.dart'
    show HomePageWidget;
import 'package:flutter_app/features/login/presentation/initial_page.dart'
    show InitialPageWidget;
import 'package:flutter_app/features/login/presentation/login_page.dart'
    show LoginPageWidget;
import 'package:flutter_app/features/login/presentation/main_page.dart'
    show MainPageWidget;

class Routing {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.initialPage:
        return MaterialPageRoute(
            builder: (context) => const InitialPageWidget());
      case RouteConstants.mainPage:
        return MaterialPageRoute(builder: (context) => const MainPageWidget());
      case RouteConstants.loginPage:
        return MaterialPageRoute(builder: (context) => const LoginPageWidget());
      case RouteConstants.homePage:
        return MaterialPageRoute(builder: (context) => const HomePageWidget());
      default:
        throw Exception("Route not found");
    }
  }
}
