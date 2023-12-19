import 'package:flutter/material.dart';
import 'package:flutter_app/riverpod/counter_page.dart';
import 'package:flutter_app/riverpod/riverpod_logger.dart';
import 'package:flutter_app/riverpod/user_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// River
void main() {
  runApp(
    ProviderScope(
      observers: [RiverpodLogger()],
      // child: CounterPageApp(),
      child: const MaterialApp(
        home: UserPageWidget(),
      ),
    ),
  );
}
