import 'package:flutter/material.dart';
import 'package:flutter_project/data/database.dart';
import 'package:flutter_project/data/models/contact_data.dart';
import 'package:hive_flutter/adapters.dart';

class AddEditScreen extends StatelessWidget {
  ContactItemData? contactItemData;
  int index;
  AddEditScreen({this.index = -1, this.contactItemData}) {
    if (contactDatabase != null) {
      nameController.text = contactItemData!.name;
      phoneController.text = contactItemData!.phoneNumber;
      emailController.text = contactItemData!.email;
    }
  }

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  List<ContactItemData> contactList = [];

  final _myBox = Hive.box<ContactItemData>('contactBox');
  var contactDatabase = ContactDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add/Edit Contact",
          // style: TextStyle(
          //   fontWeight: FontWeight.bold,
          // ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Container(
              height: 40,
              width: 130,
              child: FloatingActionButton.large(
                backgroundColor: Colors.blueAccent,
                foregroundColor: Colors.white,
                elevation: 0,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                onPressed: () {
                  if (_formKey.currentState?.validate() == true) {
                    var newContact = ContactItemData(
                      name: nameController.text,
                      phoneNumber: phoneController.text,
                      email: emailController.text,
                    );
                    if (contactItemData == null && index == -1) {
                      _myBox.add(newContact);
                    } else {
                      var updateContact = ContactItemData(
                        name: newContact.name,
                        phoneNumber: newContact.phoneNumber,
                        email: newContact.email,
                      );
                      _myBox.putAt(index, updateContact);
                    }
                    // contactList.add(newContact);
                    // contactDatabase.addContact(newContact);
                  }
                  nameController.clear();
                  phoneController.clear();
                  emailController.clear();
                  Navigator.pop(context);
                },
                child: Text("Save Contact"),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 15),
              TextFormFieldCust(
                controller: nameController,
                text: "Name",
              ),
              SizedBox(height: 15),
              TextFormFieldCust(
                controller: phoneController,
                text: "Phone",
              ),
              SizedBox(height: 15),
              TextFormFieldCust(
                controller: emailController,
                text: "Email",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TextFormFieldCust extends StatelessWidget {
  const TextFormFieldCust({
    // super.key,
    required this.controller,
    required this.text,
  });

  final TextEditingController controller;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.text,
      controller: controller,
      decoration: InputDecoration(
        label: Text("${text}"),
        labelStyle: const TextStyle(color: Colors.black),
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $text';
        } else {
          return null;
        }
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}

final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
    borderSide:
        const BorderSide(color: Colors.black, width: 1) // Rounded corners
    );
