import 'package:flutter/material.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.amberAccent,
              child: const Icon(
                Icons.add_a_photo,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
