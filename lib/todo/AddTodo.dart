import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'Todo.dart';
import 'TodoController.dart';

class AddTodo extends StatelessWidget {
  static const id = '/Todo_Screen';
  final TodoController todoController = Get.put(TodoController());

  final TextEditingController textEditingController = TextEditingController();

  AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add"),

      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                // textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "What do you want to accomplish?",
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                autofocus: true,
                controller: textEditingController,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // ignore: deprecated_member_use
                ElevatedButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Get.back();
                  },
                ),
                // ignore: deprecated_member_use
                ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () {
                    todoController.todos.add(
                      Todo(
                        text: textEditingController.text,
                      ),
                    );
                    Get.back();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}