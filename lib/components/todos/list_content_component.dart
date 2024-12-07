import 'package:flutter/material.dart';
import 'package:todoapp/components/todos/modal_delete_component.dart';
import 'package:todoapp/store/todo_list_store.dart';

import '../../views/todos/todo_edit_page.dart';
import '../../views/todos/todo_show_page.dart';

class ListContentComponent extends StatelessWidget {
  final Todo todo;

  const ListContentComponent({super.key, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SizedBox(
        width: 200,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
              ),
              child: todo.imageUrl != null
                  ? Image.network(
                      todo.imageUrl!,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.image, size: 40, color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 8.0, 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return TodoShowPage(todo: todo);
                            }),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return TodoEditPage(todo: todo);
                            }),
                          );
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                ModalDeleteComponent(todo: todo),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
