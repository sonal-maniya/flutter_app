import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        children: [
          const DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: Text("Profile Settings"),
          ),
          _buildItem(context, Icons.lock_clock_outlined, "Activity"),
          _buildItem(context, Icons.punch_clock_outlined, "Your Activity"),
          _buildItem(context, Icons.tag_faces_outlined, "Name tag"),
          _buildItem(context, Icons.save_rounded, "Saved"),
          _buildItem(context, Icons.child_friendly_sharp, "Close Friends"),
          _buildItem(context, Icons.people, "Discover People"),
          _buildItem(context, Icons.feedback, "Open Feedback"),
        ],
      ),
    );
  }

  void onTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  Widget _buildItem(BuildContext context, IconData icon, String title) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 10),
            Text(title),
          ],
        ),
      ),
    );
  }
}
