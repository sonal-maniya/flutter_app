import 'package:flutter/material.dart';
import 'package:flutter_app/features/login/presentation/main_screen.dart';
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
      // home: MainScreenWidget(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routing.onGenerateRoute,
      initialRoute: Routing.initialPage,
    );
  }
}
