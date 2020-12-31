import 'package:flutter/material.dart';
import 'package:project_basu/models/todos.dart';

class TodoCard extends StatefulWidget {
  final TodoItem todo;
  Function handler;
  TodoCard({@required this.todo, this.handler});
  @override
  _TodoCardState createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  handleCheckBox(_) {
    makeCompleted(widget.todo.id);
    widget.handler();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Dismissible(
        key: GlobalKey(),
        onDismissed: (direction) {},
        child: Card(
          elevation: 0,
          color: Colors.amber[100],
          child: Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
                child: Text(widget.todo.title, style: TextStyle(fontSize: 18)),
              ),
              Spacer(),
              Checkbox(
                  value: widget.todo.isCompleted, onChanged: handleCheckBox)
            ],
          ),
        ),
      ),
    );
  }
}
