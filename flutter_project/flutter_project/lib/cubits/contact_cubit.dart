import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/data/models/contact_data.dart';
import 'package:hive/hive.dart';

class ContactCubit extends Cubit<List<ContactItemData>> {
  final Box<ContactItemData> _contactBox;
  ContactCubit(this._contactBox) : super([]);

  void loadContacts() {
    if (_contactBox.isNotEmpty) {
      emit(_contactBox.values.toList());
    }
  }

  void addContact(ContactItemData contactItemData){
    _contactBox.add(contactItemData);
    emit([...state]);
  }

  // void updateContact(int index,ContactItemData contactItemData){
  //       final updatedTask = state[index];
  //   updatedTask.name = !updatedTask.isCompleted;
  //   _contactBox.putAt(index, updatedTask);
  //   emit([...state]);
  // }

    void deleteContact(int index) {
    _contactBox.deleteAt(index);
    emit([...state]..removeAt(index));
  }
}
