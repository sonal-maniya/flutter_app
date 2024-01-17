import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/task/bloc/task_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskListScreen extends StatelessWidget {
  const TaskListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task List"),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.allTask.length,
            itemBuilder: (context, index) {
              final task = state.allTask[index];
              return ListTile(
                title: Text(task.title),
                trailing: Checkbox(
                  onChanged: (value) {},
                  value: task.completed,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/add-task');
        },
      ),
    );
  }
}
