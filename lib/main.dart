import 'package:flutter/material.dart';
import 'package:flutter_app/constants/route_constants.dart';
import 'package:flutter_app/riverpod/riverpod_logger.dart';
import 'package:flutter_app/routes/routing.dart';
import 'package:flutter_app/stateManagement/provider/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Riverpod
void main() {
  runApp(
    ProviderScope(
      observers: [RiverpodLogger()],
      // child: CounterPageApp(),
      child: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final theme = ref.watch(themeProvider);
          return MaterialApp(
            // home: UserPageWidget(),
            themeMode:
                theme == MyThemeType.dark ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(
                primaryColor: Colors.white,
                brightness: Brightness.light,
                primarySwatch: Colors.blue,
                appBarTheme: const AppBarTheme(
                    backgroundColor: Color.fromARGB(255, 247, 246, 246),
                    foregroundColor: Colors.black),
                primaryColorDark: Colors.black,
                primaryColorLight: Colors.white,
                canvasColor: Colors.white),
            darkTheme: ThemeData(
              brightness: Brightness.dark,
              primaryColor: Colors.purple,
              primarySwatch: Colors.blue,
              appBarTheme: const AppBarTheme(
                  backgroundColor: Color.fromARGB(255, 45, 43, 43),
                  foregroundColor: Colors.white),
              primaryColorDark: const Color.fromARGB(255, 45, 43, 43),
              primaryColorLight: Colors.white,
              canvasColor: const Color.fromARGB(255, 45, 43, 43),
            ),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Routing.onGenerateRoute,
            initialRoute: RouteConstants.initialPage,
          );
        },
      ),
    ),
  );
}
