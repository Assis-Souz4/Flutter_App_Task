import 'package:flutter/material.dart';
import 'package:flutter_app_task_2024/components/my_task.dart';

class TaskInherited extends InheritedWidget {
  const TaskInherited({super.key, required this.child}) : super(child: child);

  final Widget child;

  final List<MyTask> taskList = const [
    MyTask('Learn Dart', 1, 'assets/image/dart.jpg'),
    MyTask('Learn Flutter', 2, 'assets/image/flutter.png'),
    MyTask('Mobile course', 3, 'assets/image/Mobile-App.png'),
    MyTask('Github course', 4, 'assets/image/github.png'),
    MyTask('Start Design', 5, 'assets/image/web.jpg'),
    MyTask('Test', 0, 'assets/image/test.jpg'),
  ];

  void newTask(String name, int difficulty, String photo) {
    taskList.add(MyTask(name, difficulty, photo));
  }

  static TaskInherited? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TaskInherited>();
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.taskList.length != taskList.length;
  }
}
