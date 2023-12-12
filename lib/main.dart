import 'package:flutter/material.dart';
import 'package:flutter_app/constants/route_constants.dart';
import 'package:flutter_app/routes/routing.dart';
import 'package:flutter_app/stateManagement/provider/count_provider.dart';
import 'package:flutter_app/stateManagement/screen/count_example.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyProviderApp());
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

class MyProviderApp extends StatelessWidget {
  const MyProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: const CountWidget(),
      ),
    );
  }
}
