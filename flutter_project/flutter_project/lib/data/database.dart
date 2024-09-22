import 'package:flutter_project/data/models/contact_data.dart';
import 'package:hive_flutter/adapters.dart';

class ContactDatabase {
  final _myBox = Hive.box<ContactItemData>('contactBox');

  List<ContactItemData> loadContacts() {
    return _myBox.values.cast<ContactItemData>().toList();
  }

  ContactItemData? getContact(int index) {
    return _myBox.getAt(index);
  }

  void addContact(ContactItemData contactItemData) {
    _myBox.add(contactItemData);
  }

  void deleteContact(int index) {
    _myBox.deleteAt(index);
  }

  void updateTodo(int index, ContactItemData contactItemData) {
    _myBox.putAt(index, contactItemData);
  }
}
