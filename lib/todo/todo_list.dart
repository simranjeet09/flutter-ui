import 'package:flutter/material.dart';
import 'package:flutter_assignment/todo/todo_edit.dart';
import 'package:get/get.dart';

import 'TodoController.dart';

class TodoList extends StatelessWidget {
  TodoList({Key? key}) : super(key: key);
  final TodoController todoController = Get.put(TodoController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Get.toNamed("/addTodo");
        },
      ),
      body: Obx(
            () => ListView.builder(
          itemBuilder: (context, index) => Dismissible(
            key: UniqueKey(),
            background: Container(
              color: Colors.deepOrange,
              child: const Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
            onDismissed: (_) {
              todoController.todos.removeAt(index);
              Get.snackbar('Remove!', "Task was succesfully Delete",
                  snackPosition: SnackPosition.BOTTOM);
            },
            child: ListTile(
              title: Text(
                todoController.todos[index].text!,
                style: todoController.todos[index].done
                    ? const TextStyle(
                  color: Colors.red,
                  decoration: TextDecoration.lineThrough,
                )
                    : const TextStyle(
                  color: Colors.black,
                ),
              ),
              trailing: IconButton(
                onPressed: () => Get.to(() => TodoEdit(index: index)),
                icon: const Icon(Icons.edit),
              ),
              leading: Checkbox(
                value: todoController.todos[index].done,
                onChanged: (neWvalue) {
                  var todo = todoController.todos[index];
                  todo.done = neWvalue!;
                  todoController.todos[index] = todo;
                },
              ),
            ),
          ),
          itemCount: todoController.todos.length,
        ),
      ),
    );
  }
}