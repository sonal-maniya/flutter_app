import 'package:flutter_app/todo/models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    if (title.isEmpty) {
      addError("Title cannot be empty");
      return;
    }
    final todo = Todo(
      name: title,
      createdAt: DateTime.now(),
    );

    // state.add(todo);
    // emit(state);

    emit([...state, todo]);
  }

  @override
  void onChange(Change<List<Todo>> change) {
    super.onChange(change);
    print("TodoCubit: $change");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print("TodoCubit: $error");
  }
}
