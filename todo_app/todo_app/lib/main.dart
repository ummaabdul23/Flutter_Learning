import 'package:flutter/material.dart';

void main() {
  runApp(TodoListApp());
}

// ignore: use_key_in_widget_constructors
class TodoListApp extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _TodoListAppState createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  final List<String> _todoList = [];

  void _addTodo(String todo) {
    setState(() {
      _todoList.add(todo);
    });
  }

  void _removeTodo(String todo) {
    setState(() {
      _todoList.remove(todo);
    });
  }

@override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (text) {
              _addTodo(text);
            },
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _todoList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_todoList[index]),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    _removeTodo(_todoList[index]);
                  },
                ),
              );
            },
          ),
        ],
      ),
    ),
    );
  }
}