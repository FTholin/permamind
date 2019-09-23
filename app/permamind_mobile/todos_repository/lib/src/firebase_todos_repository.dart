
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:todos_repository/todos_repository.dart';
import 'package:async/async.dart';

import 'entities/entities.dart';


class FirebaseTodosRepository implements TodosRepository {

  final todoCollection = Firestore.instance.collection('todos');
  
  final gardensCollection = Firestore.instance.collection('gardens');

  final modellingsCollection = Firestore.instance.collection('modellings');

  final plantsCollection = Firestore.instance.collection('vegetables');


  @override
  Future<void> addNewTodo(Todo todo) {
    return todoCollection.add(todo.toEntity().toDocument());
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    return todoCollection.document(todo.id).delete();
  }


  Stream<List<QuerySnapshot>> _combineStreams(String userId) {

    var stream1 = gardensCollection
        .where("gardenOwners", arrayContains: userId)
        .snapshots();

    var stream2 = gardensCollection
      .where("gardenContributors", arrayContains: userId)
      .snapshots();

    return StreamZip(([stream1, stream2])).asBroadcastStream();
  }


  @override
  Stream<List<Todo>> todos(String userId) {

    var controller = StreamController<List<Todo>>();

    _combineStreams(userId).listen((snapshots) {

      List<DocumentSnapshot> documents = List<DocumentSnapshot>();

      snapshots.forEach((snapshot) {
        documents.addAll(snapshot.documents);
      });

      final todos = documents.map((doc) {
        return Todo.fromEntity(TodoEntity.fromSnapshot(doc));
      }).toList();

      controller.add(todos);
    });

    return controller.stream;
  }


  @override
  Stream<List<Modelling>> fetchModellings() {
    return modellingsCollection.snapshots().map((snapshot) {
      return snapshot.documents
        .map((doc) => Modelling.fromEntity(ModellingEntity.fromSnapshot(doc)))
        .toList();
    });
  }


  @override
  Future<void> updateTodo(Todo update) {
    return todoCollection
        .document(update.id)
        .updateData(update.toEntity().toDocument());
  }
}