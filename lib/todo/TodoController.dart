import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Todo.dart';
//todo controller
class TodoController extends GetxController {
  // reactive object to save task elements
  var todos = List<Todo>.empty().obs;

  //reactive variable to store currently selected task position
  RxInt selectedId=0.obs;
  @override
  void onInit() {
    //fetch stored values from persistence storage
    List? storedTodos = GetStorage().read<List>('todo');
    if (storedTodos != null) {
      todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }
    //udpate stored elements if list items are changed (Add/Edit/Delete/Done)
    ever(todos, (_) {
      GetStorage().write('todo', todos.toList());
      print("saved");
    });
    super.onInit();
  }





}