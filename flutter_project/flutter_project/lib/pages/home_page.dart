import 'package:flutter/material.dart';
import 'package:flutter_project/components/contact_item.dart';
import 'package:flutter_project/data/models/contact_data.dart';
import 'package:flutter_project/pages/add_edit_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Contacts",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEditScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ContactItem(
          contactItemData: ContactItemData(
              name: "Omar", phoneNumber: "011", email: "omar@gmail.com"),
        ),
        itemCount: 10,
      ),
    );
  }
}
