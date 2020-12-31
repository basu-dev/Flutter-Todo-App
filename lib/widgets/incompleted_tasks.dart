import "package:flutter/material.dart";
import 'package:project_basu/models/todos.dart';
import 'package:project_basu/widgets/todo_card.dart';

class MainArea extends StatefulWidget {
  List<TodoItem> tasks;
  Function handler;
  MainArea({this.tasks, this.handler});
  @override
  _MainAreaState createState() => _MainAreaState();
}

class _MainAreaState extends State<MainArea> {
  makeCompleted(int id) {}
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListView.builder(
        itemBuilder: (context, index) =>
            TodoCard(todo: widget.tasks[index], handler: widget.handler),
        itemCount: widget.tasks.length,
      ),
    );
  }
}
