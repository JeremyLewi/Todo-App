import 'package:flutter/material.dart';
import 'package:flutter_todo/component/app_shell.dart';
import 'package:flutter_todo/component/todo_list.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/providers/todo_provider.dart';
import 'package:flutter_todo/screens/add_todo_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Todo> todoList = context.watch<TodoProvider>().todoList;

    return AppShell(
      title: 'Todos',
      child: TodoList(todoList: todoList),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTodoScreen(id: todoList.length + 1),
            ),
          );
        },
      ),
    );
  }
}
