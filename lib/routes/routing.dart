import 'package:flutter/material.dart';
import 'package:flutter_app/features/feed/presentation/home_screen.dart'
    show HomeScreenWidget;
import 'package:flutter_app/features/login/presentation/initial_screen.dart'
    show InitialScreenWidget;
import 'package:flutter_app/features/login/presentation/login_screen.dart'
    show LoginScreenWidget;
import 'package:flutter_app/features/login/presentation/main_screen.dart'
    show MainScreenWidget;

class Routing {
  static const String initialPage = '/';
  static const String mainPage = '/main-page';
  static const String loginPage = '/login-page';
  static const String homePage = '/home-page';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialPage:
        return MaterialPageRoute(
            builder: (context) => const InitialScreenWidget());
      case mainPage:
        return MaterialPageRoute(
            builder: (context) => const MainScreenWidget());
      case loginPage:
        return MaterialPageRoute(
            builder: (context) => const LoginScreenWidget());
      case homePage:
        return MaterialPageRoute(
            builder: (context) => const HomeScreenWidget());
      default:
        throw Exception("Route not found");
    }
  }
}
