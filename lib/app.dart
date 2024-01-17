import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/task/bloc/task_bloc.dart';
import 'package:flutter_app/presentation/task/view/add_task_screen.dart';
import 'package:flutter_app/presentation/task/view/task_list_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        title: "Task App with BLoC",
        initialRoute: '/',
        // initialRoute: AppRoutes.taskListScreen,
        // onGenerateRoute: AppRoutes.onGenerateRoute,
        routes: {
          '/': (_) => const TaskListScreen(),
          '/add-task': (_) => AddTaskScreen(),
        },
      ),
    );
  }
}
