import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({super.key});

  @override
  State<SearchPageWidget> createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  List<String> images = [
    "assets/images/img_post.jpg",
    "assets/images/img_post1.jpg",
    "assets/images/img_post2.jpg",
    "assets/images/img_post3.jpg",
    "assets/images/img_post4.jpg",
    "assets/images/img_post5.jpg",
    "assets/images/img_post6.jpg",
    "assets/images/img_post7.jpg",
    "assets/images/img_post8.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StaggeredGrid.count(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 3,
          children: List.generate(
            200,
            (index) => StaggeredGridTile.count(
              crossAxisCellCount: index % 10 == 0 ? 2 : 1,
              mainAxisCellCount: index % 10 == 0 ? 2 : 1,
              child: _buildImageTile(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageTile() {
    Random random = Random();
    int imageIndex = random.nextInt(8);
    return Container(
      color: Colors.grey[200],
      height: 100,
      child: Image.asset(
        images[imageIndex],
        fit: BoxFit.cover,
        scale: 1,
      ),
    );
  }
}
