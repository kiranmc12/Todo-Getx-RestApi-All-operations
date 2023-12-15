import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_restapi_getx/controllers/todo_controller.dart';
import 'package:todo_restapi_getx/model/todo_model.dart';
import 'package:todo_restapi_getx/screens/add/add_screen.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({Key? key});

  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "All Notes",
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: ()async {
          todoController.fetchTodo();
        },
        child: Expanded(
            child: Obx(
          () => ListView.builder(
            itemBuilder: (context, index) {
              // Pass actual data to TodoCardTileWidget
              return TodoCardTileWidget(
                todo: todoController.todoList[index],
                controller: todoController,
              );
            },
            itemCount: todoController.todoList
                .length, // Replace with the actual number of notes or items
          ),
        )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ScreenAdd(),
          ),
        ),
      ),
    );
  }
}

class TodoCardTileWidget extends StatelessWidget {
  const TodoCardTileWidget({
    Key? key,
    required this.todo,
    required this.controller,
  }) : super(key: key);

  final TodoModel todo;
  final TodoController controller;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(todo.id.toString()),
      ),
      title: Text(
        todo.title!,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: Wrap(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit),
            color: Colors.white,
          ),
          IconButton(
            onPressed: () {
              controller.deleteTodo(todo);
            },
            icon: const Icon(Icons.delete),
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
