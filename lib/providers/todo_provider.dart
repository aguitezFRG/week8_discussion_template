import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:week8datapersistence/api/firebase_todo_api.dart';
import '../models/todo_model.dart';

class TodoListProvider with ChangeNotifier {
  late Stream<QuerySnapshot> _todosStream;

  // serves as the method to be used by the provider
  var firebaseService = FirebaseTodoAPI();

  TodoListProvider() {
    fetchTodos();
  }

  // getter
  Stream<QuerySnapshot> get todo => _todosStream;

  // TODO: get all todo items from Firestore
  void fetchTodos() {
    _todosStream = firebaseService.getAllTodos();
    notifyListeners();
  }

  // TODO: add todo item and store it in Firestore
  void addTodo(Todo item) {
    // async function
    // await firebaseService.addTodo(item.toJson(item));
    
    // alternative
    firebaseService.addTodo(item.toJson(item)).then((message) {
      debugPrint(message);
    });

    notifyListeners();
  }

  // TODO: edit a todo item and update it in Firestore
  void editTodo(Todo item, String newTitle) {
    firebaseService.editTodo(item.id!, newTitle).then((message) {
      debugPrint(message);
    });
    notifyListeners();
  }

  // TODO: delete a todo item and update it in Firestore
  void deleteTodo(Todo item) {
    firebaseService.deleteTodo(item.id!).then((message) {
      debugPrint(message);
    });
    notifyListeners();
  }

  // TODO: modify a todo status and update it in Firestore
  void toggleStatus(Todo item, bool status) {
    firebaseService.toggleStatus(item.id!, status).then((message) {
      debugPrint(message);
    });
    notifyListeners();
  }
}
