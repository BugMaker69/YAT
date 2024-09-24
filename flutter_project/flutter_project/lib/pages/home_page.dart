import 'package:flutter/material.dart';
import 'package:flutter_project/components/contact_item.dart';
import 'package:flutter_project/data/database.dart';
import 'package:flutter_project/data/models/contact_data.dart';
import 'package:flutter_project/pages/add_edit_page.dart';
import 'package:hive_flutter/adapters.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ContactItemData> contactList = [];

  final _myBox = Hive.box<ContactItemData>('contactBox');

  var contactDatabase = ContactDatabase();
  @override
  void initState() {
    super.initState();
    if (_myBox.isNotEmpty) {
      contactList = contactDatabase.loadContacts();
    }
  }

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
        onPressed: () async {
          final newContact = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddEditScreen(),
            ),
          );
          if (newContact != null) {
            setState(() {
              contactList.add(newContact);
              _myBox.add(newContact);
            });
          }
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Dismissible(
          key: Key(contactList[index].name),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            setState(() {
              contactList.removeAt(index);
              _myBox.deleteAt(index);
            });
          },
          child: ContactItem(
            index: index,
            contactItemData: ContactItemData(
              name: contactList[index].name,
              phoneNumber: contactList[index].phoneNumber,
              email: contactList[index].email,
            ),
          ),
        ),
        itemCount: contactList.length,
      ),
    );
  }
}
