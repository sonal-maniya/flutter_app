import 'package:flutter/material.dart';
import 'package:flutter_app/appbar.dart';
import 'package:flutter_app/layout.dart';
import 'package:flutter_app/login_page.dart';
import 'package:flutter_app/safe_area.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // primarySwatch: Colors.deepPurple,
          ),
      home: SafeAreaWidget(),
      // home: AppBarApp(),
      // debugShowCheckedModeBanner: false,
    );
  }
}
