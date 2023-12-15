import 'package:flutter/material.dart';

import 'package:todo_restapi_getx/constants/constants.dart';
import 'package:todo_restapi_getx/model/todo_model.dart';
import 'package:todo_restapi_getx/screens/add/widgets/text_field_widget.dart';

class ScreenAdd extends StatelessWidget {
  ScreenAdd({Key? key});

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Make Your Todo",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Kheight20,
                TextFieldWidget(
                  hintText: "Title",
                  controller: titleController,
                  height: 75,
                ),
                Kheight20,
                TextFieldWidget(
                  hintText: "Description",
                  maximumLine: 6,
                  height: 170,
                  controller: descriptionController,
                ),
                Kheight20,
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: 255,
                    height: 45,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFF2C3E50)),
                        fixedSize: MaterialStateProperty.all(Size(100, 45)),
                      ),
                      onPressed: () {
                        validate(context);
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(color: Colors.white, letterSpacing: 1),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validate(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      final newTodo = TodoModel(
        
      );

      // Handle the newTodo as needed (e.g., save to a database)
      
      formKey.currentState!.reset();
    }
  }
}
