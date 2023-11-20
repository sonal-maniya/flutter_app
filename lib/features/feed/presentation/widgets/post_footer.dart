import 'package:flutter/material.dart';

class PostFooterWidget extends StatelessWidget {
  const PostFooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.favorite_border),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.comment_outlined),
        ),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/icons/ic_messenger.png",
            scale: 3,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            "assets/icons/ic_save.png",
            scale: 3.3,
          ),
        ),
      ],
    );
  }
}
