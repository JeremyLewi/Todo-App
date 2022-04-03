import 'package:flutter/cupertino.dart';
import 'package:flutter_todo/models/todo.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> todoList = [];

  TextEditingController todoTitleController = TextEditingController();
  TextEditingController todoDescriptionController = TextEditingController();

  bool _todoTitleErrorRequired = false;

  bool get todoTitleErrorRequired {
    return _todoTitleErrorRequired;
  }

  set todoTitleErrorRequired(newValue) {
    _todoTitleErrorRequired = newValue;
    notifyListeners();
  }

  DateTime? todoStartDate;
  DateTime? todoEndDate;

  todoStartDateController(DateTime date) {
    todoStartDate = date;
    notifyListeners();
  }

  todoEndDateController(DateTime date) {
    todoEndDate = date;
    notifyListeners();
  }

  todoStartDateCancel() {
    todoStartDate = null;
    notifyListeners();
  }

  todoEndDateCancel() {
    todoEndDate = null;
    notifyListeners();
  }

  clearAddTodo() {
    todoTitleController.text = '';
    todoDescriptionController.text = '';
    todoStartDate = null;
    todoEndDate = null;
    notifyListeners();
  }

  addTodo(Todo newTodo) {
    todoList.add(newTodo);
    notifyListeners();
  }
}
