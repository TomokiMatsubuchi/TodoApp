import 'package:flutter/material.dart';
import 'package:todoapp/components/todos/modal_delete_component.dart';
import 'package:todoapp/store/todo_list_store.dart';

import '../../views/todos/todo_edit_page.dart';

class ListContentComponent extends StatelessWidget {
  final Todo todo;

  const ListContentComponent({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(todo.title),
        // 編集ボタンと削除ボタンを追加
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // 編集ボタンをタップしたときの処理
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) {
                    // 遷移先の画面としてリスト追加画面を指定
                    return TodoEditPage(todo: todo);
                  }),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // 削除確認ダイアログを表示
                showDialog(
                  context: context,
                  builder: (BuildContext context) =>
                      ModalDeleteComponent(todo: todo),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
