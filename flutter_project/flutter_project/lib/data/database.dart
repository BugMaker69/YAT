import 'package:flutter_project/data/models/card_data.dart';
import 'package:hive_flutter/adapters.dart';

class TodoDataBase {
  // List todoList = [];

  final _myBox = Hive.box<CardData>('todoBox');

  // void loadData() {
  //   todoList = _myBox.get('todoList');
  // }

  // void updateDatabase() {
  //   _myBox.put('todoList', todoList);
  // }

  void addTodo(CardData cardData) {
    _myBox.add(cardData);
  }

  void deleteTodo(int index) {
    _myBox.deleteAt(index);
  }

  void updateTodo(int index, CardData cardData) {
    _myBox.putAt(index, cardData);
  }

  List<CardData> loadTodos() {
    return _myBox.values.cast<CardData>().toList();
  }
}
