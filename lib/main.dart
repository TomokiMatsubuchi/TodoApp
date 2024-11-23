import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'views/todos/todo_list_page.dart';
import 'store/todo_list_store.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => Todos()),
    ], child: MyTodoApp()),
  );
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
