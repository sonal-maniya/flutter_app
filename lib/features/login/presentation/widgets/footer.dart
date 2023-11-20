import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.black12,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Don't have account?",
            style: TextStyle(color: Colors.black45),
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              "Sign up.",
            ),
          ),
        ],
      ),
    );
  }
}
