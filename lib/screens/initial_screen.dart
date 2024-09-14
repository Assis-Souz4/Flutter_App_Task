import 'package:flutter/material.dart';
import 'package:flutter_app_task_2024/data/task_inherited.dart';
import 'package:flutter_app_task_2024/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: const SizedBox(),
        title: const Text(
          'My Task',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView(
          padding: const EdgeInsets.only(bottom: 80),
          children: TaskInherited.of(context).taskList,
        ),
      ),
      bottomSheet: const SizedBox(
        height: 50,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          shape: const CircleBorder(),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => FormScreen(
                  taskContext: context,
                ),
              ),
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}
