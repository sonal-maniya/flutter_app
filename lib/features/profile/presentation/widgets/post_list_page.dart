import 'package:flutter/material.dart';

class ProfilePostGridWidget extends StatelessWidget {
  const ProfilePostGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(20, (index) {
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
