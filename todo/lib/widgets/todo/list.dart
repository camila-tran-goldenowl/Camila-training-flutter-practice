import 'package:flutter/material.dart';


class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<String> todos = [];

  void addTodo(String todo) {
    setState(() {
      todos.add(todo);
    });
  }

  void toggleTodo(int index) {
    setState(() {
      todos[index] = todos[index].startsWith('✅ ') ? todos[index].substring(2) : '✅ ${todos[index]}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          TodoInputField(onSubmitted: addTodo),
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return TodoItem(
                  todo: todos[index],
                  onTap: () => toggleTodo(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TodoInputField extends StatefulWidget {
  final Function(String) onSubmitted;

  const TodoInputField({super.key, required this.onSubmitted});

  @override
  _TodoInputFieldState createState() => _TodoInputFieldState();
}

class _TodoInputFieldState extends State<TodoInputField> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Enter a task',
          suffixIcon: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                widget.onSubmitted(_controller.text);
                _controller.clear();
              }
            },
          ),
        ),
        onSubmitted: (value) {
          if (value.isNotEmpty) {
            widget.onSubmitted(value);
            _controller.clear();
          }
        },
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  final String todo;
  final VoidCallback onTap;

  const TodoItem({super.key, required this.todo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        todo,
        style: TextStyle(
          decoration: todo.startsWith('✅ ') ? TextDecoration.lineThrough : null,
        ),
      ),
      onTap: onTap,
    );
  }
}
