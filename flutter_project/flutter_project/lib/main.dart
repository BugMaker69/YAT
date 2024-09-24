import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/cubits/todo_cubit.dart';
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
  final todoBox = await Hive.openBox<CardData>('todoBox');
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(todoBox: todoBox),
    ),
  );
  // runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final Box<CardData> todoBox;
  const MyApp({required this.todoBox});
  // const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      darkTheme: darkMode,
      home: BlocProvider(
        create: (context) => TodoCubit(todoBox),
        child: MainScreen(),
      ),
      routes: {'/settingspage': (context) => SettingsScreen()},
    );
  }
}
