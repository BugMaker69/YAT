import 'package:flutter/material.dart';
import 'package:flutter_project/add_item.dart';
import 'package:flutter_project/card_item.dart';
import 'package:flutter_project/data/database.dart';
import 'package:flutter_project/data/models/card_data.dart';
import 'package:hive_flutter/adapters.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _myBox = Hive.box<CardData>('todoBox');
  var todoDataBase = TodoDataBase();

  List<CardData> todoList = [];

  @override
  void initState() {
    // if (_myBox.values.isNotEmpty) {
    if (_myBox.length > 0) {
      todoList = todoDataBase.loadTodos();
    }
  }

  void onCheckboxChanged(bool? value, int index) {
    setState(() {
      todoList[index] =
          CardData(isChecked: !value!, data: todoList[index].data);
      // _myBox.putAt(index, todoList[index]);

      todoDataBase.updateTodo(index, todoList[index]);

      // todoDataBase.deleteTodo(index);
      // todoDataBase.addTodo(todoList[index]);
    });
  }

  final _controller = TextEditingController();

  void saveNewTask() {
    setState(() {
      CardData newTask = CardData(isChecked: false, data: _controller.text);
      todoList.add(newTask);
      todoDataBase.addTodo(newTask);
    });

    _controller.clear();
    Navigator.pop(context);
  }

  void cancelNewTask() {
    _controller.clear();
    Navigator.pop(context);
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AddItemDialog(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: cancelNewTask,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo App"),
        actions: [
          IconButton(
            onPressed: () {
                  Navigator.pushNamed(context, '/settingspage');
                },
            icon: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.settings,
                  size: 24,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => Dismissible(
          key: Key(todoList[index].data),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            setState(() {
              todoList.removeAt(index);
              todoDataBase.deleteTodo(index);
            });
          },
          child: CardItem(
            data: todoList[index].data,
            isChecked: todoList[index].isChecked,
            onChanged: (value) =>
                onCheckboxChanged(todoList[index].isChecked, index),
          ),
        ),
        itemCount: todoList.length,
        separatorBuilder: (context, index) => SizedBox(height: 16),
      ),
    );
  }
}
