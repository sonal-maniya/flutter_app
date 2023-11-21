import 'package:flutter/material.dart';

class PageIndicatorWidget extends StatelessWidget {
  final double indicatorSize = 5;
  const PageIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: indicatorSize,
          backgroundColor: Colors.amber,
        ),
        SizedBox(
          width: 4,
        ),
        CircleAvatar(
          radius: 4,
          backgroundColor: Colors.amber,
        ),
        SizedBox(
          width: 4,
        ),
        CircleAvatar(
          radius: 4,
          backgroundColor: Colors.amber,
        )
      ],
    );
  }
}
