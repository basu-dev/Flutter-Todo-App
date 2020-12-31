import "package:flutter/material.dart";
import 'package:project_basu/models/todos.dart';

class AddItemDialog extends StatefulWidget {
  Function handler;
  AddItemDialog({this.handler});
  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  String todoText;
  textValChanged(val) {
    setState(() {
      todoText = val;
    });
  }

  saveClicked() {
    addTodo(todoText);
    print(todoText);
    Navigator.of(context).pop();
    widget.handler();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Add a Todo",
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
      content: Container(
          child: TextField(
        onChanged: textValChanged,
        decoration: InputDecoration(hintText: "Enter Your Todo."),
      )),
      actions: [
        TextButton(onPressed: saveClicked, child: Text("Save")),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Cancel")),
      ],
    );
  }
}
