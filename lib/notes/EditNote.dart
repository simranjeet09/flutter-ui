import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'NotesController.dart';

class EditNote extends StatelessWidget {
  final int? index;
  EditNote({Key? key, @required this.index}) : super(key: key);
  final NotesController notesController = Get.put(NotesController());
  @override
  Widget build(BuildContext context) {
    final TextEditingController textEditingController =
    TextEditingController(text: notesController.notes[index!].text);
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
        actions:   [InkWell(
          onTap: (){
            notesController.notes.removeAt(index!);
            Get.back();

          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.delete),
          ),
        )],
      ),
      body: Container(
        padding: const EdgeInsets.all(9),
        child: Column(
          children: [
            Card(
              elevation: 9,
              child: TextField(
                // textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(9),
                  border: InputBorder.none,
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
                child: const Text('Update'),
                onPressed: () {
                  var editing = notesController.notes[index!];
                  editing.text = textEditingController.text;
                  if (editing.text!.isNotEmpty) {
                    notesController.notes[index!] = editing;
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