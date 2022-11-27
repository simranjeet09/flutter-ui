import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'NoteModel.dart';
import 'NotesController.dart';

class AddNote extends StatelessWidget {
  final  todoController = Get.put(NotesController());

  final TextEditingController textEditingController = TextEditingController();

  AddNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),

      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Card(
              elevation: 9,
              child: TextField(
                // textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(9),
                  hintText: "Type here",
                  focusedBorder: InputBorder.none,
                ),
                style: const TextStyle(
                  fontSize: 25.0,
                ),
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                autofocus: true,
                controller: textEditingController,
              ),
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text('Add'),
                onPressed: () {
                  if(textEditingController.text.isNotEmpty){
                    todoController.notes.add(
                      NoteModel(
                        text: textEditingController.text,
                      ),
                    );
                    Get.back();

                  }

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}