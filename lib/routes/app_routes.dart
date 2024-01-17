import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/task/view/add_task_screen.dart';
import 'package:flutter_app/presentation/task/view/task_list_screen.dart';

class AppRoutes {
  static const String initialRoute = '/';

  static const String taskListScreen = '/task_list_screen';

  static const String addTaskScreen = '/add_task_screen';

  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case taskListScreen:
        return MaterialPageRoute(
          builder: (context) => const TaskListScreen(),
        );
      case addTaskScreen:
        return MaterialPageRoute(
          builder: (context) => AddTaskScreen(),
        );
      default:
        throw Exception('Route not found');
    }
  }
}
