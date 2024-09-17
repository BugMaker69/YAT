import 'package:flutter/material.dart';

class AddItemDialog extends StatelessWidget {
  // const AddItemDialog({super.key});

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  AddItemDialog(
      {required this.controller, required this.onSave, required this.onCancel});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add Item"),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text("Add New Task"),
            hintText: "Add New Task",
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "please enter";
            } else {
              return null;
            }
          },
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      buttonPadding: EdgeInsets.symmetric(horizontal: 50),
      actions: [
        ElevatedButton(
          onPressed: onCancel,
          child: Text("Cancel"),
        ),
        ElevatedButton(
            onPressed: () {
              if (_formKey.currentState?.validate() == true) {
                onSave();
              }
            },
            child: Text("Add")),
      ],
    );
  }
}
