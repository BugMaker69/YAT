import 'package:flutter/material.dart';
import 'package:flutter_project/add_item.dart';
import 'package:flutter_project/card_item.dart';
import 'package:flutter_project/card_items_page.dart';
import 'package:flutter_project/data/database.dart';
import 'package:hive_flutter/adapters.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // final List todoList = [
  //   ["Finish", true],
  //   ["Do", false]
  // ];

  final _myBox = Hive.box('todoBox');
  var todoDataBase = TodoDataBase();

  @override
  void initState() {
    if (_myBox.get('todoList') != null) {
      todoDataBase.loadData();
    }
  }

  void onCheckboxChanged(bool? value, int index) {
    setState(() {
      todoDataBase.todoList[index][1] = !todoDataBase.todoList[index][1];
      todoDataBase.updateDatabase();
    });
  }

  final _controller = TextEditingController();

  void saveNewTask() {
    setState(() {
      todoDataBase.todoList.add([_controller.text, false]);
      todoDataBase.updateDatabase();
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => Dismissible(
          key: Key(todoDataBase.todoList[index][0]),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            setState(() {
              todoDataBase.todoList.removeAt(index);
              todoDataBase.updateDatabase();
            });
          },
          child: CardItem(
            data: todoDataBase.todoList[index][0],
            isChecked: todoDataBase.todoList[index][1],
            onChanged: (value) =>
                onCheckboxChanged(todoDataBase.todoList[index][1], index),
          ),
        ),
        itemCount: todoDataBase.todoList.length,
        separatorBuilder: (context, index) => SizedBox(height: 16),
      ),
    );
  }
}
