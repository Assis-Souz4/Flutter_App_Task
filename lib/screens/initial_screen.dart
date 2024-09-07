import 'package:flutter/material.dart';
import 'package:flutter_app_task_2024/components/my_task.dart';
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
          children: const [
            SizedBox(
              height: 20,
            ),
            MyTask('Learn Dart', 1, 'assets/image/dart.jpg'),
            MyTask('Learn Flutter', 2, 'assets/image/flutter.png'),
            MyTask('Mobile course', 3, 'assets/image/Mobile-App.png'),
            MyTask('Github course', 4, 'assets/image/github.png'),
            MyTask('Start Design', 5, 'assets/image/web.jpg'),
            MyTask('Test', 0, 'assets/image/test.jpg'),
            SizedBox(height: 90),
          ],
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
                builder: (context) => const FormScreen(),
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
