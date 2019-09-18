import 'dart:async';
import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:todos_repository/todos_repository.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodosRepository _todosRepository;
  StreamSubscription _todosSubscription;


  final AuthenticationBloc _authenticationBloc;
  StreamSubscription _authenticationBlocSubscription;

  TodosBloc(this._authenticationBloc, this._todosRepository) {
    _authenticationBlocSubscription = _authenticationBloc.state.listen((state) {
      // React to state changes here.
      // Dispatch events here to trigger changes in MyBloc.
      if (state is Authenticated) {
        dispatch(LoadTodos(state.userId));
      }
    });
  }

  @override
  TodosState get initialState => TodosNotLoaded();

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    if (event is LoadTodos) {
      yield* _mapLoadTodosToState(event);
    } else if (event is AddTodo) {
      yield* _mapAddTodoToState(event);
    } else if (event is UpdateTodo) {
      yield* _mapUpdateTodoToState(event);
    } else if (event is DeleteTodo) {
      yield* _mapDeleteTodoToState(event);
    } else if (event is ToggleAll) {
      yield* _mapToggleAllToState();
    } else if (event is ClearCompleted) {
      yield* _mapClearCompletedToState();
    } else if (event is TodosUpdated) {
      yield* _mapTodosUpdateToState(event);
    }
//    } else if (event is TodosInit) {
//      yield* _mapTodosInitToState();
//    }
  }

  Stream<TodosState> _mapLoadTodosToState(LoadTodos event) async* {

    _todosSubscription?.cancel();

    _todosSubscription = _todosRepository.todos(event.userId).listen(
          (todos) {
        dispatch(
          TodosUpdated(todos),
        );
      },
    );

  }

  Stream<TodosState> _mapAddTodoToState(AddTodo event) async* {
    _todosRepository.addNewTodo(event.todo);
  }

  Stream<TodosState> _mapUpdateTodoToState(UpdateTodo event) async* {
    _todosRepository.updateTodo(event.updatedTodo);
  }

  Stream<TodosState> _mapDeleteTodoToState(DeleteTodo event) async* {
    _todosRepository.deleteTodo(event.todo);
  }

  Stream<TodosState> _mapToggleAllToState() async* {
    final state = currentState;
    if (state is TodosLoaded) {
      final allComplete = state.todos.every((todo) => todo.complete);
      final List<Todo> updatedTodos = state.todos
          .map((todo) => todo.copyWith(complete: !allComplete))
          .toList();
      updatedTodos.forEach((updatedTodo) {
        _todosRepository.updateTodo(updatedTodo);
      });
    }
  }

  Stream<TodosState> _mapClearCompletedToState() async* {
    final state = currentState;
    if (state is TodosLoaded) {
      final List<Todo> completedTodos =
      state.todos.where((todo) => todo.complete).toList();
      completedTodos.forEach((completedTodo) {
        _todosRepository.deleteTodo(completedTodo);
      });
    }
  }

  Stream<TodosState> _mapTodosUpdateToState(TodosUpdated event) async* {
    yield TodosLoaded(event.todos);
  }

  @override
  void dispose() {
    _todosSubscription?.cancel();
    _authenticationBlocSubscription?.cancel();
    super.dispose();
  }


//  Stream<TodosState> _mapTodosInitToState() async* {
//    try {
//      final isSignedIn = await _userRepository.isSignedIn();
//      if (isSignedIn) {
//        final name = await _userRepository.getUserId();
//        yield Authenticated(name);
//      } else {
//        yield Unauthenticated();
//      }
//    } catch (_) {
//      yield Unauthenticated();
//    }
//  }
}