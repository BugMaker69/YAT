import 'package:hive_flutter/adapters.dart';

class TodoDataBase {
  List todoList = [];

  final _myBox = Hive.box('todoBox');

  void loadData() {
    todoList = _myBox.get('todoList');
  }

  void updateDatabase() {
    _myBox.put('todoList', todoList);
  }
}
