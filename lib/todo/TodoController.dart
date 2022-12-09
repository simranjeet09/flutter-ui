import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'Todo.dart';

class TodoController extends GetxController {
  var todos = List<Todo>.empty().obs;
  RxInt selectedId=0.obs;
  @override
  void onInit() {
    List? storedTodos = GetStorage().read<List>('todo');
    if (storedTodos != null) {
      todos = storedTodos.map((e) => Todo.fromJson(e)).toList().obs;
    }
    ever(todos, (_) {
      GetStorage().write('todo', todos.toList());
      print("saved");
    });
    super.onInit();
  }





}