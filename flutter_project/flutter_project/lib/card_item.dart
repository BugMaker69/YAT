import 'package:flutter/material.dart';
import 'package:flutter_project/data/models/card_data.dart';

class CardItem extends StatelessWidget {
  CardItem({required this.data,required this.isChecked,required this.onChanged});
  String data;
  bool isChecked;
  // CardItem({required this.data,required this.onChanged});
  // CardData data;
  Function (bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Checkbox(
              value: isChecked,
              onChanged: onChanged
            ),
            Text(
              "${data}",
              style: TextStyle(
                fontFamily: 'Viga',
                fontSize: 18,
                decoration: isChecked
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
