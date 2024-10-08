import 'package:flutter/material.dart';
import 'package:flutter_app_task_2024/data/task_inherited.dart';
import 'package:flutter_app_task_2024/screens/initial_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter app task 2024',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: TaskInherited(
        child: const InitialScreen(),
      ),
    );
  }
}
