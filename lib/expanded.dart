import 'package:flutter/material.dart';

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildBox(Colors.black12),
          Expanded(
            flex: 3,
            child: _buildBox(Colors.amber),
          ),
          _buildBox(Colors.pinkAccent),
          Expanded(
            flex: 1,
            child: _buildBox(Colors.blueAccent),
          ),
        ],
      )),
    );
  }

  Widget _buildBox(Color color) {
    return Container(
      color: color,
      width: 50,
      height: 50,
    );
  }
}
