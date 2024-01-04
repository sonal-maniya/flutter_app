import 'package:flutter_app/task/model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TaskNotifier extends StateNotifier<List<Task>> {
  TaskNotifier()
      : super([
          Task("Task 1", true),
          Task("Task 2", true),
          Task("Task 3", true),
          Task("Task 4", false),
        ]);

  void toggleTaskCompleted(int index) {
    state = [
      ...state.sublist(0, index),
      Task(state[index].title, !state[index].isCompleted),
      ...state.sublist(index + 1),
    ];
  }
}
