import 'package:flutter/material.dart';
import 'package:flutter_project/card_data.dart';

class CardItem extends StatefulWidget {
  CardItem({required this.data});
  // const CardItem({super.key});

  CardData data;

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Checkbox(
              value: widget.data.isChecked,
              onChanged: (bool? value) {
                setState(() {
                  widget.data.isChecked = value!;
                });
              },
            ),
            Text(
              "${widget.data.data}",
              style: TextStyle(
                fontSize: 18,
                decoration: widget.data.isChecked
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
