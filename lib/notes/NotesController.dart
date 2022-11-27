import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'NoteModel.dart';

class NotesController extends GetxController {
  var notes = List<NoteModel>.empty().obs;

  @override
  void onInit() {
    List? storedTodos = GetStorage().read<List>('notes');
    if (storedTodos != null) {
      notes = storedTodos.map((e) => NoteModel.fromJson(e)).toList().obs;
    }
    ever(notes, (_) {
      GetStorage().write('notes', notes.toList());
      print("saved");
    });
    super.onInit();
  }



}