import 'package:flutter/material.dart';

class AddItemDialog extends StatelessWidget {
  const AddItemDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Item"),
      content: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          label: Text("Add New Task"),
          hintText: "Add New Task",
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      buttonPadding: EdgeInsets.symmetric(horizontal: 50),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancel"),
        ),
        ElevatedButton(onPressed: () {}, child: Text("Add")),
      ],
    );
  }
}
