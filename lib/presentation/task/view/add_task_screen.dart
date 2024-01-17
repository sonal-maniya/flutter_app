import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/task/bloc/task_bloc.dart';
import 'package:flutter_app/presentation/task/models/task_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({super.key});
  final taskTitleController = TextEditingController();

  int generateRandomId() {
    // Create an instance of the Random class
    Random random = Random();

    // Generate a random integer (you can customize the range if needed)
    int id = random.nextInt(1000000);

    return id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Task"),
      ),
      body: Column(
        children: [
          TextField(
            controller: taskTitleController,
            decoration: const InputDecoration(
              hintText: "Title",
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              var task = Task(
                  id: generateRandomId(),
                  title: taskTitleController.text,
                  description: taskTitleController.text);
              context.read<TaskBloc>().add(AddTask(task: task));
              Navigator.of(context).pop();
              taskTitleController.clear();
            },
            child: const Text("Add"),
          ),
        ],
      ),
    );
  }
}
