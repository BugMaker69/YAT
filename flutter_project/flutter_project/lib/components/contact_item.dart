import 'package:flutter/material.dart';
import 'package:flutter_project/data/models/contact_data.dart';
import 'package:flutter_project/pages/add_edit_page.dart';

class ContactItem extends StatelessWidget {
  ContactItem({required this.contactItemData, required this.index});
  // const ContactItem({super.key});

  ContactItemData contactItemData;
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 8, start: 8, end: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  AddEditScreen(contactItemData: contactItemData, index: index),
            ),
          );
        },
        child: Card(
          color: Colors.amber,
          child: Container(
            height: 70,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "${contactItemData.name[0]}".toUpperCase(),
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${contactItemData.name}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        "${contactItemData.phoneNumber}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black.withAlpha(100),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
