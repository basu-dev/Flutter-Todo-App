import "package:flutter/material.dart";
import 'package:project_basu/models/todos.dart';

class CompletedTasks extends StatefulWidget {
  List<TodoItem> tasks;
  CompletedTasks({this.tasks});

  @override
  _CompletedTasksState createState() => _CompletedTasksState();
}

class _CompletedTasksState extends State<CompletedTasks> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: completedTodos.length,
        itemBuilder: (context, index) {
          return Dismissible(
            onDismissed: (direction) {
              removeItem(completedTodos[index]);
            },
            key: GlobalKey(),
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.green[400],
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                    child: Text(
                  widget.tasks[index].title,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ))),
          );
        });
  }
}
