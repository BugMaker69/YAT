import 'package:flutter/material.dart';
import 'package:flutter_project/add_item.dart';
import 'package:flutter_project/card_items_page.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ToDo App"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddItemDialog(),
              ),
            );
          },
          child: Icon(Icons.add)),
      body: ItemsList(),
    );
  }
}
