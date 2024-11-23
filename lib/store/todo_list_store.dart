import 'package:flutter/foundation.dart';

class TodoListStore extends ChangeNotifier {
  List<String> _todoList = [];

  List<String> get todoList => _todoList;

  void addTodoList(String todo) {
    _todoList.add(todo);
    notifyListeners();
  }
}
