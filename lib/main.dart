import 'package:flutter/material.dart';
import 'views/todo_list_page.dart';

void main() {
  runApp(MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // アプリ名
      title: 'My Todo App',
      theme: ThemeData(
        // テーマカラー
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      // リスト一覧画面を表示
      home: TodoListPage(),
    );
  }
}
