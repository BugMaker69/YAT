import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Card With Colors',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(),
        body: ListView.separated(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
          itemCount: 30,
          itemBuilder: (context, index) => CardItems(),
          separatorBuilder: (context, index) => SizedBox(height: 20),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final TextAlign align;

  const CardItem({required this.title, required this.align});
  // const CardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              textAlign: align,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardItems extends StatelessWidget {
  const CardItems({super.key});

  @override
  Widget build(BuildContext context) {
    Random randomX = new Random();
    int x = randomX.nextInt(255);
    Random randomY = new Random();
    int y = randomY.nextInt(255);
    Random randomZ = new Random();
    int z = randomZ.nextInt(255);
    Random opacity = new Random();
    double opacity1 = randomZ.nextDouble();

    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(x, y, z, opacity1),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsetsDirectional.all(8),
      height: 200,
      child: Column(
        children: [
          CardItem(title: "Top Left", align: TextAlign.start),
          CardItem(title: "Center", align: TextAlign.center),
          CardItem(title: "Bottom Right", align: TextAlign.end),
        ],
      ),
    );
  }
}
