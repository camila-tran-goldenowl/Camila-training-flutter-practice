import 'package:flutter/material.dart';
import 'package:myapp/widgets/todo/card.dart';

class TodoList extends StatelessWidget {
  final List<String> todos;

  const TodoList({super.key, required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        return TodoCard(
          task: todos[index],
          onToggle: (value) {},
          onDelete: () {},
          onEdit: () {},
          completed: false,
        );
      },
    );
  }
}
