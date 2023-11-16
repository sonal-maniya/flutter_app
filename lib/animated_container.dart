import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  Color boxColor = Colors.yellowAccent;
  double boxSize = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Random random = new Random();
              int randomNo = random.nextInt(5);
              const colors = [
                Colors.amber,
                Colors.greenAccent,
                Colors.blueAccent,
                Colors.pinkAccent,
                Colors.redAccent,
              ];
              setState(() {
                boxColor = colors[randomNo] ?? Colors.lightGreen;
                boxSize = boxSize == 80 ? 100 : 80;
              });
            },
            child: const Text("Click Here"),
          ),
          Spacer(),
          Center(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              curve: Curves.linear,
              height: boxSize,
              width: boxSize,
              color: boxColor,
            ),
          ),
          Spacer(),
        ],
      )),
    );
  }
}
