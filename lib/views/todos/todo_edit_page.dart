import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/components/todos/form_component.dart';

import '../../store/todo_list_store.dart';

// リスト追加画面用Widget
class TodoEditPage extends StatelessWidget {
  final Todo todo;

  const TodoEditPage({super.key, required this.todo});

  void updateTodos(BuildContext context, Todo updatedTodo) {
    final todos = Provider.of<Todos>(context, listen: false);
    todos.update(todo.id, updatedTodo);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo編集'),
        ),
        body: FormComponent(
          initialTodo: todo,
          submit: (updatedTodo) => updateTodos(context, updatedTodo),
          submitText: '更新する',
        ));
  }
}
