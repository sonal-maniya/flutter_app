import 'package:flutter/material.dart';

class PostDetailTextWidget extends StatelessWidget {
  const PostDetailTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(color: Colors.black87),
        children: [
          TextSpan(
              text: "joshua_l", style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(
            text:
                " The game in Japan was amazing and I want to share some photos ",
          ),
        ],
      ),
    );
  }
}
