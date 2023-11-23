import 'package:flutter/material.dart';
import 'package:flutter_app/constants/route_constants.dart';
import 'package:flutter_app/features/appTab/app_tab_page.dart'
    show AppTabWidget;
import 'package:flutter_app/features/list/presentation/list_page.dart'
    show ListPageWidget;
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
      case RouteConstants.appTabPage:
        return MaterialPageRoute(builder: (context) => const AppTabWidget());
      case RouteConstants.listPage:
        return MaterialPageRoute(builder: (context) => const ListPageWidget());
      default:
        throw Exception("Route not found");
    }
  }
}
