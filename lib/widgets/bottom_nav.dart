import "package:flutter/material.dart";
import 'package:project_basu/widgets/completed_task.dart';

class BottomNav extends StatefulWidget {
  Function pageChanged;
  BottomNav({this.pageChanged});
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int bottomIndex = 0;
  buttonClicked(int index) {
    setState(() {
      bottomIndex = index;
    });
    widget.pageChanged(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: bottomIndex,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
        BottomNavigationBarItem(
            icon: Icon(Icons.check), title: Text("Completed"))
      ],
      onTap: buttonClicked,
    );
  }
}
