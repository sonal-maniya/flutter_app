import 'package:flutter/material.dart';

class AppLogoWidget extends StatelessWidget {
  final double height;

  const AppLogoWidget({Key? super.key, this.height = 50});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage('assets/images/img_logo.png'),
      height: height,
    );
  }
}
