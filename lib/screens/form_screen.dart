import 'package:flutter/material.dart';
import 'package:flutter_app_task_2024/data/task_inherited.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key, required this.taskContext});

  final BuildContext taskContext;

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController difficultyController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool valueValidator(String value) {
    if (value.isEmpty) {
      return true;
    }
    return false;
  }

  bool difficultyValidator(String value) {
    if (value.isEmpty) {
      return true;
    }
    try {
       final intValue = int.parse(value);
      return intValue > 5 || intValue < 1;
    } catch (e) {
       return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'New Task',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.cyan,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Center(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.cyan[50],
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(width: 3)),
                  width: 400,
                  height: 700,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          validator: (String? value) {
                            if (valueValidator(value!)) {
                              return 'Add task name';
                            }
                            return null;
                          },
                          controller: nameController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                            hintText: 'Name',
                            border: OutlineInputBorder(),
                            fillColor: Colors.white70,
                            filled: true,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          validator: (value) {
                            if (difficultyValidator(value!)) {
                              return 'Enter a value from 1 to 5';
                            }
                            return null;
                          },
                          controller: difficultyController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              fillColor: Colors.white70,
                              filled: true,
                              border: OutlineInputBorder(),
                              hintText: 'Difficulty'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {});
                          },
                          validator: (value) {
                            if (valueValidator(value!)) {
                              return 'Enter an image url';
                            }
                            return null;
                          },
                          controller: imageController,
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.url,
                          decoration: const InputDecoration(
                              fillColor: Colors.white70,
                              filled: true,
                              border: OutlineInputBorder(),
                              hintText: 'Image'),
                        ),
                      ),
                      Container(
                        width: 100,
                        height: 120,
                        decoration: BoxDecoration(
                            color: Colors.white70,
                            border: Border.all(width: 2, color: Colors.cyan),
                            borderRadius: BorderRadius.circular(6)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                            imageController.text,
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Image.asset(
                                'assets/image/no_photo.avif',
                                fit: BoxFit.cover,
                              );
                            },
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan,
                            shape: ContinuousRectangleBorder(
                                borderRadius: BorderRadius.circular(6))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            TaskInherited.of(widget.taskContext).newTask(
                                nameController.text,
                                int.parse(difficultyController.text),
                                imageController.text);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Creating a new task!'),
                              ),
                            );
                            Navigator.pop(context);
                          }
                        },
                        child: const Text(
                          'Add Task',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
