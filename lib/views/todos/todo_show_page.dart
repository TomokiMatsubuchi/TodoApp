import 'package:flutter/material.dart';
import '../../store/todo_list_store.dart';
import 'package:url_launcher/url_launcher.dart';

// 詳細画面用Widget
class TodoShowPage extends StatelessWidget {
  final Todo todo;

  const TodoShowPage({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height -
                MediaQuery.of(context).padding.top,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'タイトル',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  todo.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 24),
                Text(
                  'メモ',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  todo.memo,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 24),
                Text(
                  'リンク',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () async {
                    try {
                      final Uri url = Uri.parse(todo.link!);
                      if (!await canLaunchUrl(url)) {
                        throw 'URLを開けません: $url';
                      }
                      await launchUrl(
                        url,
                        mode: LaunchMode.inAppWebView,
                      );
                    } catch (e) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('リンクを開けませんでした: $e')),
                        );
                      }
                    }
                  },
                  child: Text(
                    todo.link!,
                    style: const TextStyle(
                      color: Colors.blue,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
