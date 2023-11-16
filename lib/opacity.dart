import 'dart:math';

import 'package:flutter/material.dart';

class OpacityContainerWidget extends StatefulWidget {
  const OpacityContainerWidget({super.key});

  @override
  State<OpacityContainerWidget> createState() => _OpacityContainerWidgetState();
}

class _OpacityContainerWidgetState extends State<OpacityContainerWidget> {
  double opacity = 80;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                opacity = opacity == 1 ? 0 : 1;
              });
            },
            child: const Text("Click Here"),
          ),
          Spacer(),
          Center(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.yellow,
            ),
          ),
          Spacer(),
          Opacity(
            opacity: opacity,
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
              ),
            ),
          ),
          Spacer(),
          AnimatedOpacity(
            opacity: opacity,
            duration: Duration(milliseconds: 500),
            child: Center(
              child: Container(
                height: 100,
                width: 100,
                color: Colors.yellow,
              ),
            ),
          ),
          Spacer(),
        ],
      )),
    );
  }
}
