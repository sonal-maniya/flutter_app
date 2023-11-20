import 'package:flutter/material.dart';
import 'package:flutter_app/features/feed/presentation/home_page.dart'
    show HomePageWidget;
import 'package:flutter_app/features/login/presentation/initial_page.dart'
    show InitialPageWidget;
import 'package:flutter_app/features/login/presentation/login_page.dart'
    show LoginPageWidget;
import 'package:flutter_app/features/login/presentation/main_page.dart'
    show MainPageWidget;

class Routing {
  static const String initialPage = '/';
  static const String mainPage = '/main-page';
  static const String loginPage = '/login-page';
  static const String homePage = '/home-page';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialPage:
        return MaterialPageRoute(
            builder: (context) => const InitialPageWidget());
      case mainPage:
        return MaterialPageRoute(builder: (context) => const MainPageWidget());
      case loginPage:
        return MaterialPageRoute(builder: (context) => const LoginPageWidget());
      case homePage:
        return MaterialPageRoute(builder: (context) => const HomePageWidget());
      default:
        throw Exception("Route not found");
    }
  }
}
