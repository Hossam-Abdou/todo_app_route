import 'package:flutter/material.dart';

class UpdateTaskScreen extends StatelessWidget {
  static const String routeName = "updateTaskScreen";

  const UpdateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ToDo App",
        ),
      ),
    );
  }
}
