import 'package:flutter/material.dart';
import 'package:flutter_todo/component/empty_todo.dart';
import 'package:flutter_todo/component/todo_item.dart';
import 'package:flutter_todo/models/todo.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todoList;

  const TodoList({
    Key? key,
    required this.todoList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return todoList.isEmpty
        ? const EmptyTodo()
        : ListView(
            children: todoList.map((todo) => TodoItem(data: todo)).toList(),
          );
  }
}
