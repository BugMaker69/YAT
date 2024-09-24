import 'package:flutter/material.dart';
import 'package:flutter_project/data/models/card_data.dart';
import 'package:flutter_project/pages/main_page.dart';
import 'package:flutter_project/pages/settings_page.dart';
import 'package:flutter_project/themes/ThemeProvider.dart';
import 'package:flutter_project/themes/theme.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(CardDataAdapter());
  await Hive.openBox<CardData>('todoBox');
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      theme: ligthMdoe,
      darkTheme: darkMode,
      home: MainScreen(),
      routes: {'/settingspage': (context) => SettingsScreen()},
    );
  }
}
