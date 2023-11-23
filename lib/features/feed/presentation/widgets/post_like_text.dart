import 'package:flutter/material.dart';

class PostLikeTextWidget extends StatelessWidget {
  const PostLikeTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: const TextSpan(
        style: TextStyle(color: Colors.black87),
        children: [
          TextSpan(
            text: "Liked by",
          ),
          TextSpan(
              text: "Joe Maisal",
              style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(
            text: " and ",
          ),
          TextSpan(
            text: "45,545",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: " others",
          ),
        ],
      ),
    );
  }
}
