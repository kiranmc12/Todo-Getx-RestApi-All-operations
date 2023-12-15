import 'package:get/get.dart';
import 'package:todo_restapi_getx/model/todo_model.dart';
import 'package:todo_restapi_getx/services/api.dart';

class TodoController extends GetxController {
  RxList<TodoModel> todoList = <TodoModel>[].obs;

  @override
  void onInit() {
    fetchTodo();
    super.onInit();
  }

  void fetchTodo() async {
    var todo = await Api().fetchTodos();
    if (todo != null) {
      todoList.value = todo;
    }
  }

  Future<String> deleteTodo(TodoModel todo) async {
    var res =await Api().deleteTodo(todo);
    print(res);
    return res;
  }
}
