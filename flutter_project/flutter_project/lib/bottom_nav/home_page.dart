import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 64),
          SizedBox(height: 24),
          Text("Welcome Home!"),
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.explore),
                SizedBox(width: 8),
                Text("Explore"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
