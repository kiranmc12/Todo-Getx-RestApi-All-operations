import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:todo_restapi_getx/model/todo_model.dart';

class Api {
  String dataUrl = "https://jsonplaceholder.typicode.com";

  Future<List<TodoModel>> fetchTodos() async {
    try {
      final response = await http
          .get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
      print(response.statusCode);

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        return responseData.map((json) => TodoModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch todos');
      }
    } catch (e) {
      print('Error fetching todos: $e');
      throw Exception('Failed to fetch todos');
    }
  }

  Future<String> deleteTodo(TodoModel todo) async {
    var url = Uri.parse('$dataUrl/todos/${todo.id}');
    var result = 'false';

    try {
      var response = await http.delete(url);
      if (response.statusCode == 200) {
        print("deleted ${response.statusCode}");
        result = 'true';
      }
    } catch (error) {
      print('Error deleting todo: $error');
    }

    return result;
  }
}
