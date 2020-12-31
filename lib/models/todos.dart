import "dart:math" as math;

class TodoItem {
  final int id;
  final String title;
  bool isCompleted;
  TodoItem({this.id, this.title, this.isCompleted = false});
}

List<TodoItem> todos = [
  TodoItem(id: 1, title: "Buy eggs", isCompleted: true),
  TodoItem(id: 2, title: "Read Digital Communication", isCompleted: false),
  TodoItem(id: 3, title: "Wash Clothes", isCompleted: false),
  TodoItem(id: 4, title: " Call Mom", isCompleted: false),
  TodoItem(id: 5, title: "Fuck Bitch", isCompleted: true),
  TodoItem(id: 6, title: "Eat Cookies", isCompleted: true),
  TodoItem(id: 7, title: "Celebrate new year", isCompleted: false),
  TodoItem(id: 8, title: "Buy beer", isCompleted: true),
];

List<TodoItem> get completedTodos {
  print("Calling");
  return todos.where((element) => element.isCompleted == true).toList();
}

List<TodoItem> get incompleteTodos {
  return todos.where((element) => element.isCompleted == false).toList();
}

void makeCompleted(id) {
  var todo = todos.firstWhere((element) => element.id == id);
  todo.isCompleted = true;
}

void removeItem(todo) {
  // var todo = todos.firstWhere((element) => element.id == id);
  todos.remove(todo);
}

void addTodo(todoText) {
  TodoItem todo = TodoItem(id: math.Random().nextInt(10000), title: todoText);
  todos.add(todo);
}
