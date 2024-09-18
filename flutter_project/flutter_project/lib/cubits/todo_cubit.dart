import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/data/models/card_data.dart';
import 'package:hive/hive.dart';


class TodoCubit extends Cubit<List<CardData>> {

  final Box<CardData> _todoBox;

  TodoCubit(this._todoBox) : super([]) {
    // Load the initial list of todos from the Hive box
    loadTodos();
  }

  // Load the todos list from Hive
  void loadTodos() {
    if (_todoBox.isNotEmpty) {
      emit(_todoBox.values.toList());
    }
  }

  // Add a new task
  void addTodo(String title) {
    final newTask = CardData(data: title, isChecked: false);
    _todoBox.add(newTask);
    emit([...state, newTask]);
  }

  // Update a task (toggle completion)
  void updateTodo(int index) {
    final updatedTask = state[index];
    updatedTask.isChecked = !updatedTask.isChecked;
    _todoBox.putAt(index, updatedTask);
    emit([...state]);
  }

  // Delete a task
  void deleteTodo(int index) {
    _todoBox.deleteAt(index);
    emit([...state]..removeAt(index));
  }
}