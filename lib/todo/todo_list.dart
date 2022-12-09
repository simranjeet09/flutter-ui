import 'package:flutter/material.dart';
import 'package:flutter_assignment/todo/todo_edit.dart';
import 'package:get/get.dart';

import '../colors.dart';
import 'TodoController.dart';

class TodoList extends StatelessWidget {
  TodoList({Key? key}) : super(key: key);
  final TodoController todoController = Get.put(TodoController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,

        title: Text("Todo"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: PRIMARY_COLOR,
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Get.toNamed("/addTodo");
        },
      ),
      body: Obx(
            () => todoController.todos.isEmpty?Center(child: Text("Click on + button to add a new TODO\n\nSwipe right any task to delete",textAlign: TextAlign.center),):ListView.builder(
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
              Get.snackbar('Remove!', "Task  successfully Deleted",
                  snackPosition: SnackPosition.BOTTOM);
            },
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    title: Text(
                      todoController.todos[index].text!,
                      style: todoController.todos[index].done
                          ? const TextStyle(
                        color: Colors.red,
                        decoration: TextDecoration.lineThrough,
                      )
                          : const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        todoController.selectedId(index);
                        Get.toNamed("/editTodo", arguments: index);

                      },
                      icon: const Icon(Icons.edit_note, color: PRIMARY_COLOR,),
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
              ],
            ),
          ),
          itemCount: todoController.todos.length,
        ),
      ),
    );
  }
}