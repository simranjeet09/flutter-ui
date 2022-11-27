import 'package:flutter/material.dart';
import 'package:flutter_assignment/notes/EditNote.dart';
import 'package:flutter_assignment/todo/todo_edit.dart';
import 'package:get/get.dart';

import 'NotesController.dart';

class NotesList extends StatelessWidget {
  NotesList({Key? key}) : super(key: key);
  final  todoController = Get.put(NotesController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
        ),
        onPressed: () {
          Get.toNamed("/addNote");
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
              todoController.notes.removeAt(index);
              Get.snackbar('Remove!', "Task was succesfully Delete",
                  snackPosition: SnackPosition.BOTTOM);
            },
            child: Card(
              elevation: 9,
              child: ListTile(
                title: Text(
                  todoController.notes[index].text!,
                  style: todoController.notes[index].done
                      ? const TextStyle(
                    color: Colors.red,
                    decoration: TextDecoration.lineThrough,
                  )
                      : const TextStyle(
                    color: Colors.black,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () => Get.to(() => EditNote(index: index)),
                  icon: const Icon(Icons.edit),
                ),

              ),
            ),
          ),
          itemCount: todoController.notes.length,
        ),
      ),
    );
  }
}