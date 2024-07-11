import 'dart:convert';

class Todo {
  String? id;
  // same dapat sa firestore yung key
  String title;
  bool completed;

  Todo({
    this.id,
    required this.title,
    required this.completed,
  });

  // Factory constructor to instantiate object from json format
  // json format yung nasa firestore
  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['title'],
      completed: json['completed'],
    );
  }

  static List<Todo> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Todo>((dynamic d) => Todo.fromJson(d)).toList();
  }

  // passing object to firebase
  Map<String, dynamic> toJson(Todo todo) {
    return {
      'title': todo.title,
      'completed': todo.completed,
    };
  }
}
