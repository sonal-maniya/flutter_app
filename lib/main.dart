import 'package:flutter/material.dart';
import 'package:flutter_app/constants/route_constants.dart';
import 'package:flutter_app/routes/routing.dart';

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
        primaryColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routing.onGenerateRoute,
      initialRoute: RouteConstants.initialPage,
    );
  }
}
