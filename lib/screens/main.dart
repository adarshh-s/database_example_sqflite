import 'package:database_example/db/functions/db_functions.dart';
import 'package:database_example/screens/screen_main.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding;
  await initializeDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 134, 121, 176))),
      home: const MyScreen(),
    );
  }
}
