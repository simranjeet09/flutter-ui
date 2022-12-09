import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors.dart';
import 'TodoController.dart';

class TodoEdit extends StatelessWidget {
  TodoEdit({Key? key}) : super(key: key);
  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
    TextEditingController(text: todoController.todos[todoController.selectedId.value].text);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        title: Text("Edit"),

      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                // textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: "Enter your task here",
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                  ),
                  child: const Text('Delete'),
                  onPressed: () {
                    todoController.todos.removeAt(todoController.selectedId.value);
                    Get.back();
                  },
                ),
                // ignore: deprecated_member_use
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: PRIMARY_COLOR,
                  ),
                  child: const Text('Update'),
                  onPressed: () {
                    var editing = todoController.todos[todoController.selectedId.value];
                    editing.text = textEditingController.text;
                    todoController.todos[todoController.selectedId.value] = editing;
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}