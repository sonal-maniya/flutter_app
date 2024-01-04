import 'package:flutter/material.dart';
import 'package:flutter_app/app.dart';
import 'package:flutter_app/task_app.dart';
import 'package:flutter_app/todo_app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Riverpod
void main() {
  // runApp(const CounterApp());
  // runApp(const TodoApp()); // -> BLoC
  runApp(const ProviderScope(
    child: TaskApp(),
  )); // -> MVC
}
