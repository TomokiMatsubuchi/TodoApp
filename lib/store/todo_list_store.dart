import 'package:flutter/foundation.dart';

class Todo {
  int id = 0;
  String title;
  String memo;
  late String link;
  final String? imageUrl;

  Todo({
    required this.title,
    required this.memo,
    required String link,
    this.imageUrl,
  }) {
    try {
      final uri = Uri.parse(link);
      if (!uri.hasScheme || !uri.hasAuthority) {
        throw const FormatException('無効なURL形式です。正しい形式を入力してください。');
      }
      this.link = link;
    } catch (e) {
      throw const FormatException('無効なURL形式です。正しい形式を入力してください。');
    }
  }
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
