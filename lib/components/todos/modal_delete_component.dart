import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/store/todo_list_store.dart';

class ModalDeleteComponent extends StatelessWidget {
  final Todo todo;

  const ModalDeleteComponent({super.key, required this.todo});

  void deleteTodo(BuildContext context) {
    final todos = Provider.of<Todos>(context, listen: false);
    todos.delete(todo.id);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('削除の確認'),
      content: Text('「${todo.title}」を削除してもよろしいですか？'),
      actions: <Widget>[
        TextButton(
          child: const Text('キャンセル'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
          ),
          onPressed: () => deleteTodo(context),
          child: const Text('削除', style: const TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
