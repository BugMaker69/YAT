

// import 'package:flutter/material.dart';
// import 'package:flutter_project/card_data.dart';
// import 'package:flutter_project/card_item.dart';

// class ItemsList extends StatelessWidget {
//   // ItemsList({super.key});
//   // const ItemsList({super.key});

//     ItemsList({required this.data,required this.isChecked,required this.onChanged});
//   String data;
//   bool isChecked;
//   // CardItem({required this.data,required this.onChanged});
//   // CardData data;
//   Function (bool?)? onChanged;

//   // List list = [
//   //   CardData(isChecked: true, data: "Hello"),
//   //   CardData(isChecked: false, data: "World"),
//   //   CardData(isChecked: true, data: "Me"),
//   //   CardData(isChecked: false, data: "Omar"),
//   // ];

//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       itemBuilder: (context, index) => CardItem(data: data,isChecked: isChecked,onChanged: onChanged),
//       separatorBuilder: (context, index) => SizedBox(height: 16),
//       itemCount: 4,
//     );
//   }
// }