import 'package:flutter/material.dart';

class SearchPageWidget extends StatefulWidget {
  const SearchPageWidget({super.key});

  @override
  State<SearchPageWidget> createState() => _SearchPageWidgetState();
}

class _SearchPageWidgetState extends State<SearchPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 100,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text("data"),
            ),
            collapsedHeight: 10,
            toolbarHeight: 0,
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 150.0,
              mainAxisSpacing: 2.0,
              crossAxisSpacing: 2.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: Colors.amber[100 * (index % 9)],
                  height: 1000,
                  child: Image.asset(
                    "assets/images/img_post.jpg",
                    fit: BoxFit.cover,
                    scale: 1,
                  ),
                );
              },
              childCount: 100,
            ),
          )
        ],
      ),
    );
  }
}
