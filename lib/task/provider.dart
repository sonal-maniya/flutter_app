import 'package:flutter_app/task/model.dart';
import 'package:flutter_app/task/task_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, List<Task>>((ref) {
  return TaskNotifier();
});
