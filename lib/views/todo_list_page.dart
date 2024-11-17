import 'package:flutter/material.dart';
import './todo_add_page.dart';

// リスト一覧画面用Widget
class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  // Todoリストのデータ
  List<String> todoList = [];

  void addTodoList(String todo) {
    setState(() {
      todoList.add(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リスト一覧'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(todoList[index]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // 新規Todo追加画面に遷移
          // リスト追加画面から渡される値を受け取る
          final newListText = await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return TodoAddPage();
            }),
          );
          if (newListText != null && newListText.trim().isNotEmpty) {
            // 空白文字のみの場合も除外
            addTodoList(newListText as String);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
