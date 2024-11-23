import 'package:flutter/material.dart';
import '/store/todo_list_store.dart';

// 入力されるテキストが可変のためStatefulWidgetを継承する
class FormComponent extends StatefulWidget {
  final void Function(Todo todo) submit;
  final String submitText;
  final Todo? initialTodo;

  const FormComponent({
    super.key,
    required this.submit,
    this.submitText = 'リスト追加',
    this.initialTodo,
  });

  @override
  FormComponentState createState() => FormComponentState();
}

class FormComponentState extends State<FormComponent> {
  late final TextEditingController _titleController;
  late final TextEditingController _memoController;
  late final TextEditingController _linkController;

  final Todo _todo = Todo(
    title: '',
    memo: '',
    link: '',
  );

  void _updateTextState({String? title, String? memo, String? link}) {
    setState(() {
      if (title?.isNotEmpty == true) _todo.title = title!;
      if (memo?.isNotEmpty == true) _todo.memo = memo!;
      if (link?.isNotEmpty == true) _todo.link = link!;
    });
  }

  @override
  void initState() {
    super.initState();
    // コントローラーの初期化
    _titleController =
        TextEditingController(text: widget.initialTodo?.title ?? '');
    _memoController =
        TextEditingController(text: widget.initialTodo?.memo ?? '');
    _linkController =
        TextEditingController(text: widget.initialTodo?.link ?? '');

    if (widget.initialTodo != null) {
      _updateTextState(
        title: widget.initialTodo!.title,
        memo: widget.initialTodo!.memo,
        link: widget.initialTodo!.link,
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _memoController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // 余白を付ける
      padding: const EdgeInsets.all(64),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'タイトル',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _titleController,
            onChanged: (String value) {
              _updateTextState(title: value);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'メモ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _memoController,
            maxLines: 8, // 8行分の高さを確保
            decoration: const InputDecoration(
              border: OutlineInputBorder(), // 枠線をつける
              contentPadding: EdgeInsets.all(8), // 内側の余白
            ),
            onChanged: (String value) {
              _updateTextState(memo: value); // memoとして更新
            },
          ),
          const SizedBox(
            height: 16,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'リンク',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: _linkController,
            onChanged: (String value) {
              _updateTextState(link: value);
            },
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            // 横幅いっぱいに広げる
            width: double.infinity,
            // リスト追加ボタン
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              onPressed: () => widget.submit(_todo),
              child: Text(widget.submitText,
                  style: const TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            // 横幅いっぱいに広げる
            width: double.infinity,
            // キャンセルボタン
            child: TextButton(
              // ボタンをクリックした時の処理
              onPressed: () {
                // "pop"で前の画面に戻る
                Navigator.of(context).pop();
              },
              child: const Text('キャンセル'),
            ),
          ),
        ],
      ),
    );
  }
}
