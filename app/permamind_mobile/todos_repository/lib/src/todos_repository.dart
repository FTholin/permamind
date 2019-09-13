import 'dart:async';

import 'package:todos_repository/todos_repository.dart';

abstract class TodosRepository {
  Future<void> addNewTodo(Todo todo);

  Future<void> deleteTodo(Todo todo);

  Stream<List<Todo>> todos(String userId);
//  Future<Stream> todos(String userId);


  Future<void> updateTodo(Todo todo);
}
