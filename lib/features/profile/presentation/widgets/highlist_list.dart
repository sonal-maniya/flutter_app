import 'package:flutter/material.dart';

class ProfilePostGridWidget extends StatefulWidget {
  const ProfilePostGridWidget({super.key});

  @override
  State<ProfilePostGridWidget> createState() => _ProfilePostGridWidgetState();
}

class _ProfilePostGridWidgetState extends State<ProfilePostGridWidget>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.grid_3x3_rounded),
            ),
            Tab(
              icon: Icon(Icons.person_2_outlined),
            ),
          ],
        ),
        TabBarView(
          controller: _tabController,
          children: [
            _renderGrid(),
            _renderGrid(),
          ],
        ),
      ],
    );
  }

  Widget _renderGrid() {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(50, (index) {
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: Image.asset(
              fit: BoxFit.cover,
              key: Key("Item $index"),
              "assets/images/img_post1.jpg"),
        );
      }),
    );
  }
}
