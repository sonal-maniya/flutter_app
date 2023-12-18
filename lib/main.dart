import 'package:flutter/material.dart';
import 'package:flutter_app/riverpod/counter_page.dart';
import 'package:flutter_app/riverpod/user_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// River
void main() {
  runApp(
    const ProviderScope(
      // child: CounterPageApp(),
      child: MaterialApp(
        home: UserPageWidget(),
      ),
    ),
  );
}
