import 'package:flutter/material.dart';
import 'package:flutter_app/constants/route_constants.dart';
import 'package:flutter_app/routes/routing.dart';
import 'package:flutter_app/stateManagement/provider/count_provider.dart';
import 'package:flutter_app/stateManagement/provider/example_one_provider.dart';
import 'package:flutter_app/stateManagement/provider/favourite_provider.dart';
import 'package:flutter_app/stateManagement/provider/login_provider.dart';
import 'package:flutter_app/stateManagement/provider/theme_provider.dart';
import 'package:flutter_app/stateManagement/screen/count_example.dart';
import 'package:flutter_app/stateManagement/screen/example_one.dart';
import 'package:flutter_app/stateManagement/screen/favourite/dark_theme.dart';
import 'package:flutter_app/stateManagement/screen/favourite/favourite_page.dart';
import 'package:flutter_app/stateManagement/screen/favourite/value_notifier_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => LoginProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          onGenerateRoute: Routing.onGenerateRoute,
          initialRoute: RouteConstants.initialPage,
        ));
  }
}

class MyProviderApp extends StatelessWidget {
  const MyProviderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            themeMode: themeProvider.themeMode,
            theme: ThemeData(
              primaryColor: Colors.white,
              brightness: Brightness.light,
              primarySwatch: Colors.amber,
            ),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: Colors.purple,
              primarySwatch: Colors.blue,
              appBarTheme: const AppBarTheme(backgroundColor: Colors.teal),
            ),
            debugShowCheckedModeBanner: false,
            home: ValueNotifierWidget(),
          );
        }));
  }
}
