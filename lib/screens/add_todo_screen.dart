import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_todo/component/app_shell.dart';
import 'package:flutter_todo/component/datetime_picker.dart';
import 'package:flutter_todo/component/input_field.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/providers/todo_provider.dart';

class AddTodoScreen extends StatefulWidget {
  final int id;
  const AddTodoScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  @override
  Widget build(BuildContext context) {
    TodoProvider todoProvider = context.watch<TodoProvider>();

    return AppShell(
      title: 'Add Todo',
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 8),
            InputField(
              label: 'Judul Kegiatan',
              controller: todoProvider.todoTitleController,
              isRequired: true,
              isError: todoProvider.todoTitleErrorRequired,
              onChange: (value) {
                value == ''
                    ? todoProvider.todoTitleErrorRequired = true
                    : todoProvider.todoTitleErrorRequired = false;
              },
            ),
            const SizedBox(height: 18),
            InputField(
              label: 'Keterangan',
              maxLines: 5,
              controller: todoProvider.todoDescriptionController,
            ),
            const SizedBox(height: 18),
            DateTimePicker(
              date: todoProvider.todoStartDate,
              controller: todoProvider.todoStartDateController,
              cancel: todoProvider.todoStartDateCancel,
              label: 'Start date :',
            ),
            const SizedBox(height: 18),
            DateTimePicker(
              date: todoProvider.todoEndDate,
              controller: todoProvider.todoEndDateController,
              cancel: todoProvider.todoEndDateCancel,
              label: 'End date :',
            ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      todoProvider.clearAddTodo();
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel'),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 24,
                      ),
                      side: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (todoProvider.todoTitleController.text == '') {
                        todoProvider.todoTitleErrorRequired = true;
                        return;
                      }

                      Todo newTodo = Todo(
                        id: widget.id,
                        title: todoProvider.todoTitleController.text,
                        description:
                            todoProvider.todoDescriptionController.text,
                        startDate: todoProvider.todoStartDate,
                        endDate: todoProvider.todoEndDate,
                      );

                      todoProvider.addTodo(newTodo);
                      todoProvider.clearAddTodo();
                      Navigator.pop(context);
                    },
                    child: const Text('Add'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 24,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
