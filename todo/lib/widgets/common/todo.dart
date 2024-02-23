import 'package:flutter/material.dart';
import 'package:myapp/widgets/card/card.dart'; // Adjust this import based on your project structure

class XTodo extends StatelessWidget {
  final String task;
  final bool completed;

  const XTodo({super.key, required this.task, this.completed = false});

  @override
  Widget build(BuildContext context) {
    return XCard( // Remove const here
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  task, // Use the task provided in the constructor
                  style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    ); // Add a semicolon here
  }
}
