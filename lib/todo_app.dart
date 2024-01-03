import 'package:flutter/material.dart';
import 'package:flutter_app/counter/cubit/counter_cubit.dart';
import 'package:flutter_app/todo/cubit/todo_cubit.dart';
import 'package:flutter_app/todo/view/add_todo_page.dart';
import 'package:flutter_app/todo/view/todo_list_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => TodoCubit()),
      ],
      child: MaterialApp(
        title: "Todo App with BLoC",
        initialRoute: '/',
        routes: {
          '/': (_) => const TodoListPage(),
          '/add-todo': (_) => AddTodoPage(),
        },
      ),
    );
  }
}
