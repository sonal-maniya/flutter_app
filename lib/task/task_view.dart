import 'package:flutter/material.dart';
import 'package:flutter_app/task/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskPage extends StatelessWidget {
  const TaskPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task List"),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final tasks = ref.watch(taskProvider);

          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return ListTile(
                title: Text(task.title),
                leading: Checkbox(
                  value: task.isCompleted,
                  onChanged: (value) {
                    ref.read(taskProvider.notifier).toggleTaskCompleted(index);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
