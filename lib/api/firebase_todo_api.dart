import 'package:cloud_firestore/cloud_firestore.dart';


// TODO: implement Firebase API for connecting/accompishing methods
// Provider bridges the API with the UI


class FirebaseTodoAPI {
  // allows us to access methods of the firestore
  final FirebaseFirestore db = FirebaseFirestore.instance;

  // async but in real time
  // like Promise in CMSC 100, but real time
  Stream<QuerySnapshot> getAllTodos() {
    // returns the current contents of the collection
    return db.collection("todos").snapshots();
  }

  Future<String> addTodo(Map<String, dynamic> todo) async {
    try {
      await db.collection("todos").add(todo);
      return "Successfully added todo!";
    }
    on FirebaseException catch (e) {
      return "Failed with error ${e.code}";
    }
  }

  Future<String> deleteTodo(String id) async {
    try {
      await db.collection("todos").doc(id).delete();
      return "Successfully deleted todo!";
    }
    on FirebaseException catch (e) {
      return "Failed with error ${e.code}";
    }
  }

  Future<String> editTodo(String id, String newTitle) async {
    try {
      // specify the field to be updated
      // unspecified attribute remains the same
      await db.collection("todos").doc(id).update({
        "title": newTitle
      });
      return "Successfully edited todo!";
    }
    on FirebaseException catch (e) {
      return "Failed with error ${e.code}";
    }
  }

  Future<String> toggleStatus(String id, bool status) async {
    try {
      await db.collection("todos").doc(id).update({
        "completed": status
      });
      return "Successfully toggled todo!";
    }
    on FirebaseException catch (e) {
      return "Failed with error ${e.code}";
    }
  }

  // if async await yung gagamitin sa provider
  // dapat Future<void>
}