import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/add_item.dart';
import 'package:flutter_project/card_item.dart';
import 'package:flutter_project/cubits/todo_cubit.dart';
import 'package:flutter_project/data/models/card_data.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final _controller = TextEditingController();

  void saveNewTask(BuildContext context) {
    context.read<TodoCubit>().addTodo(_controller.text);
    _controller.clear();
    Navigator.pop(context);
  }

  void cancelNewTask(BuildContext context) {
    _controller.clear();
    Navigator.pop(context);
  }

  void createNewTask(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AddItemDialog(
          controller: _controller,
          onSave: () => saveNewTask(context),
          onCancel: () => cancelNewTask(context),
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
        onPressed: () => createNewTask(context),
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<TodoCubit, List<CardData>>(
        builder: (context, todoList) {
          return ListView.separated(
            itemBuilder: (context, index) => Dismissible(
              key: Key(todoList[index].data),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                context.read<TodoCubit>().deleteTodo(index);
              },
              child: CardItem(
                data: todoList[index].data,
                isChecked: todoList[index].isChecked,
                onChanged: (value) =>
                    context.read<TodoCubit>().updateTodo(index),
              ),
            ),
            itemCount: todoList.length,
            separatorBuilder: (context, index) => SizedBox(height: 16),
          );
        },
      ),
    );
  }
}
