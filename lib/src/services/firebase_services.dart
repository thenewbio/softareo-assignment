import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:uuid/uuid.dart';

class FirestoreServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> addTodo(String title, bool? status) async {
    String response = "An error occured";
    try {
      String todoId = const Uuid().v1();
      _firestore
          .collection('todos')
          .doc(todoId)
          .set({'title': title, 'status': status});
      response = "Todo added Successfully";
    } catch (e) {
      return e.toString();
    }
    return response;
  }

  Future<String> deleteTodo(String id) async {
    String response = "Failed to delete todo";
    try {
      _firestore.collection('todos').doc(id).delete();
      response = "Todo deleted Successfully";
    } catch (e) {
      return e.toString();
    }
    return response;
  }

  Future<void> editTodo(
    String id,
    String title,
  ) async {
    try {
      _firestore.collection('todos').doc(id).update({
        'title': title,
      });
    } catch (e) {
      e.toString();
    }
  }

  Future<void> editStatus(String id, bool status) async {
    try {
      _firestore.collection('todos').doc(id).update({'status': status});
    } catch (e) {
      e.toString();
    }
  }
}
