import 'package:project_basu/models/todos.dart';
import 'package:project_basu/widgets/add_item_dialog.dart';
import 'package:project_basu/widgets/incompleted_tasks.dart';
import 'package:project_basu/widgets/bottom_nav.dart';
import 'package:project_basu/widgets/completed_task.dart';

import "package:flutter/material.dart";

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;
  List<TodoItem> completed;
  List<TodoItem> incomplete;
  List pages = [];
  bool isAlertShown = false;
  @override
  void initState() {
    super.initState();
    currentPage = 0;
    refresh();
  }

  refresh() {
    setState(() {
      pages = [
        MainArea(tasks: incompleteTodos, handler: refresh),
        CompletedTasks(tasks: completedTodos)
      ];
    });
  }

  pageChanged(index) {
    setState(() {
      currentPage = index;
    });
  }

  Future<Widget> _showAddTodo() async {
    return showDialog(
        context: context,
        builder: (BuildContext builder) {
          return AddItemDialog(handler: refresh);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          pages[currentPage],
        ],
      ),
      bottomNavigationBar: BottomNav(pageChanged: pageChanged),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _showAddTodo();
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
