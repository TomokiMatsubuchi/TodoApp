import 'package:flutter/material.dart';

class ListContentComponent extends StatelessWidget {
  final String todo;

  const ListContentComponent({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(todo),
        // 編集ボタンと削除ボタンを追加
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // 編集ボタンをタップしたときの処理
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                // 削除ボタンをタップしたときの処理
              },
            ),
          ],
        ),
      ),
    );
  }
}
