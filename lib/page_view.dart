import 'package:flutter/material.dart';

class PageViewWidgetState extends StatefulWidget {
  const PageViewWidgetState({super.key});

  @override
  State<PageViewWidgetState> createState() => _PageViewWidgetStateState();
}

class _PageViewWidgetStateState extends State<PageViewWidgetState> {
  final pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        scrollDirection: Axis.vertical,
        controller: pageController,
        onPageChanged: (value) => {debugPrint(value.toString())},
        children: [
          _buildPage(1),
          _buildPage(2),
          _buildPage(3),
          _buildPage(4),
        ],
      )),
    );
  }

  Widget _buildPage(int page) {
    return Center(
      child: Text(
        "PAGE ${page.toString()}",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
