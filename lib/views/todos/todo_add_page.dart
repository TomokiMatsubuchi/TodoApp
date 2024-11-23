import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/components/todos/form_component.dart';

import '../../store/todo_list_store.dart';

// リスト追加画面用Widget
class TodoAddPage extends StatelessWidget {
  const TodoAddPage({super.key});

  void createTodos(BuildContext context, Todo todo) {
    // TodosStoreの状態を更新する
    final todos = Provider.of<Todos>(context, listen: false);
    todos.create(todo);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo作成'),
        ),
        body: FormComponent(
          submit: (todo) => createTodos(context, todo),
          submitText: '作成する',
        ));
  }
}
