import 'package:flutter/material.dart';
import 'package:flutter_project/bottom_nav/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(
            color: Colors.blue,
            fontSize: 36,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.blue),
        useMaterial3: true,
      ),
      home: MainScreen(),
    );
  }
}
