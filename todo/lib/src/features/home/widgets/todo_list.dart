import 'package:flutter/material.dart';
import 'package:myapp/widgets/todo/card.dart';

class TodoList extends StatelessWidget {

  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TodoCard(task: 'Task 1', completed: false, onDelete: (){}, onEdit:(){}),
      const SizedBox(height: 8.0),
      TodoCard(task: 'Task 2', completed: true, onDelete: (){}, onEdit:(){}),
      const SizedBox(height: 8.0),
      TodoCard(task: 'Task 3', completed: true, onDelete: (){}, onEdit:(){}),
      const SizedBox(height: 8.0),
      TodoCard(task: 'Task 4', completed: false, onDelete: (){}, onEdit:(){}),
      const SizedBox(height: 8.0),
      TodoCard(task: 'Task 5', completed: false, onDelete: (){}, onEdit:(){}),
      const SizedBox(height: 8.0),
      TodoCard(task: 'Task 6', completed: false, onDelete: (){}, onEdit:(){}),
      const SizedBox(height: 8.0),
    ]);
  }
}
