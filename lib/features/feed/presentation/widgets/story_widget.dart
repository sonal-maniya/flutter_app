import 'package:flutter/material.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 70,
      child: Column(
        children: [
          InkWell(
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/img_story_back.png"),
              radius: 35,
              child: CircleAvatar(
                radius: 31,
                backgroundImage: AssetImage("assets/images/img_user.jpg"),
              ),
            ),
          ),
          Text(
            "karennne",
            style: TextStyle(
              color: Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
