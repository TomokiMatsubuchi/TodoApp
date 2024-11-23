import 'package:flutter/foundation.dart';

class Todo {
  int id = 0;
  String title;
  String memo;
  String link;

  Todo({
    required this.title,
    required this.memo,
    required this.link,
  });
}

class Todos extends ChangeNotifier {
  final List<Todo> _todoList = [];

  List<Todo> get todoList => _todoList;

  void create(Todo todo) {
    final index = _todoList.length > 0 ? _todoList.last.id + 1 : 0;
    todo.id = index;
    _todoList.add(todo);
    notifyListeners();
  }

  void update(int id, Todo updatedTodo) {
    final index = _todoList.indexWhere((todo) => todo.id == id);
    _todoList[index] = updatedTodo;
    notifyListeners();
  }

  void delete(int id) {
    _todoList.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }
}
