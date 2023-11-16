import 'package:flutter/material.dart';
import 'package:flutter_app/layout.dart';
import 'package:flutter_app/login_page.dart';

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My App"),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("This is Snackbar")));
            },
            tooltip: 'Show Snackbar',
            icon: const Icon(Icons.add_alert),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const BasicWidget();
              }));
            },
            icon: const Icon(Icons.navigate_next),
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return const LoginPage();
              }));
            },
            child: const Text("Login Page")),
      ),
    );
  }
}
