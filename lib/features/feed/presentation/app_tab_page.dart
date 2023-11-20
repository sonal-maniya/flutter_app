import 'package:flutter/material.dart';
import 'package:flutter_app/constants/route_constants.dart';
import 'package:flutter_app/features/feed/presentation/home_page.dart';

class AppTabWidget extends StatefulWidget {
  const AppTabWidget({super.key});

  @override
  State<AppTabWidget> createState() => _AppTabWidgetState();
}

class _AppTabWidgetState extends State<AppTabWidget> {
  int currentPage = 0;

  void onTabButtonPress(String tabName) {
    debugPrint(tabName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => onTabButtonPress(RouteConstants.homeTab),
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () => onTabButtonPress(RouteConstants.searchTab),
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () => onTabButtonPress(RouteConstants.addPostTab),
              icon: const Icon(Icons.add_box_outlined),
            ),
            IconButton(
              onPressed: () => onTabButtonPress(RouteConstants.favoriteTab),
              icon: const Icon(Icons.favorite_outline),
            ),
            IconButton(
              onPressed: () => onTabButtonPress(RouteConstants.profileTab),
              icon: const Icon(Icons.person_2_outlined),
            ),
          ],
        ),
      ),
      body: const HomePageWidget(),
    );
  }
}
