import 'package:flutter/material.dart';
import 'package:flutter_app/task/task_controller.dart';
import 'package:flutter_app/task/task_view.dart';

class TaskApp extends StatelessWidget {
  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Task App with MVC",
      initialRoute: '/',
      home: TaskPage(),
    );
  }
}
