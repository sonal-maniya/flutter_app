import 'package:flutter/material.dart';

class WrapWidget extends StatelessWidget {
  const WrapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.center,
          children: [
            _buildBox(Colors.orangeAccent),
            _buildBox(Colors.cyanAccent),
            _buildBox(Colors.orangeAccent),
            _buildBox(Colors.cyanAccent),
            _buildBox(Colors.orangeAccent),
            _buildBox(Colors.cyanAccent),
            _buildBox(Colors.orangeAccent),
            _buildBox(Colors.cyanAccent),
            _buildBox(Colors.orangeAccent),
            _buildBox(Colors.cyanAccent),
            _buildBox(Colors.orangeAccent),
            _buildBox(Colors.cyanAccent),
            _buildBox(Colors.orangeAccent),
            _buildBox(Colors.cyanAccent),
            _buildBox(Colors.orangeAccent),
            _buildBox(Colors.cyanAccent),
            _buildBox(Colors.orangeAccent),
            _buildBox(Colors.cyanAccent),
            _buildBox(Colors.orangeAccent),
            _buildBox(Colors.cyanAccent),
            _buildBox(Colors.orangeAccent),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(Color color) {
    return Container(
      color: color,
      width: 60,
      height: 60,
    );
  }
}
