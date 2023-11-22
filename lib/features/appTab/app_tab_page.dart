import 'package:flutter/material.dart';
import 'package:flutter_app/constants/route_constants.dart';
import 'package:flutter_app/features/feed/presentation/home_page.dart';
import 'package:flutter_app/features/search/presentation/search_page.dart';

class AppTabWidget extends StatefulWidget {
  const AppTabWidget({super.key});

  @override
  State<AppTabWidget> createState() => _AppTabWidgetState();
}

class _AppTabWidgetState extends State<AppTabWidget> {
  int currentPage = 0;

  void onTabButtonPress(String tabName, {int index = 0}) {
    debugPrint(tabName);
    setState(() {
      currentPage = index;
    });
  }

  final List<Widget> pages = [
    HomePageWidget(),
    SearchPageWidget(),
    HomePageWidget(),
    HomePageWidget(),
    HomePageWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => onTabButtonPress(
                RouteConstants.homeTab,
              ),
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () =>
                  onTabButtonPress(RouteConstants.searchTab, index: 1),
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () =>
                  onTabButtonPress(RouteConstants.addPostTab, index: 2),
              icon: const Icon(Icons.add_box_outlined),
            ),
            IconButton(
              onPressed: () =>
                  onTabButtonPress(RouteConstants.favoriteTab, index: 3),
              icon: const Icon(Icons.favorite_outline),
            ),
            IconButton(
              onPressed: () =>
                  onTabButtonPress(RouteConstants.profileTab, index: 4),
              icon: const Icon(Icons.person_2_outlined),
            ),
          ],
        ),
      ),
      body: pages[currentPage],
    );
  }
}
