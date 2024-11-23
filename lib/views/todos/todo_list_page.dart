import 'package:flutter/material.dart';
import '../../store/todo_list_store.dart';
import 'todo_add_page.dart';
import '../../components/todos/list_content_component.dart';
import 'package:provider/provider.dart';

// リスト一覧画面用Widget
class TodoListPage extends StatelessWidget {
  const TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo一覧'),
      ),
      body: Consumer<Todos>(builder: (context, Todos, child) {
        return ListView.builder(
          itemCount: Todos.todoList.length,
          itemBuilder: (context, index) {
            return ListContentComponent(todo: Todos.todoList[index]);
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 新規Todo追加画面に遷移
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              // 遷移先の画面としてリスト追加画面を指定
              return const TodoAddPage();
            }),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
