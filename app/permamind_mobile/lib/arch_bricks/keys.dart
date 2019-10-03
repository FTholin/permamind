import 'package:flutter/widgets.dart';

class ArchSampleKeys {
  // Home Screens
  static final homeScreen = const Key('__homeScreen__');
  static final addTodoFab = const Key('__addTodoFab__');
  static final addGardenFab = const Key('__addGardenFab__');
  static final snackbar = const Key('__snackbar__');
  static Key snackbarAction(String id) => Key('__snackbar_action_${id}__');

  // Todos
  static final todoList = const Key('__todoList__');
  static final todosLoading = const Key('__todosLoading__');
  static final todoItem = (String id) => Key('TodoItem__${id}');
  static final todoItemCheckbox =
      (String id) => Key('TodoItem__${id}__Checkbox');
  static final todoItemTask = (String id) => Key('TodoItem__${id}__Task');
  static final todoItemNote = (String id) => Key('TodoItem__${id}__Note');

  // Tabs
  static final tabs = const Key('__tabs__');
  static final todoTab = const Key('__todoTab__');
  static final gardenTab = const Key('__gardenTab__');
  static final abcTab = const Key('__abcTab__');
  static final learningTab = const Key('_learningTab__');
  static final settingsTab = const Key('__settingTab__');
  static final statsTab = const Key('__statsTab__');

  // Extra Actions
  static final extraActionsButton = const Key('__extraActionsButton__');
  static final toggleAll = const Key('__markAllDone__');
  static final clearCompleted = const Key('__clearCompleted__');
  static final loggedOut = const Key('__loggedOut__');
  static final loggedOutButton = const Key('__loggedOutButton__');

  // Filters
  static final filterButton = const Key('__filterButton__');
  static final allFilter = const Key('__allFilter__');
  static final activeFilter = const Key('__activeFilter__');
  static final completedFilter = const Key('__completedFilter__');

  // Stats
  static final statsCounter = const Key('__statsCounter__');
  static final statsLoading = const Key('__statsLoading__');
  static final statsNumActive = const Key('__statsActiveItems__');
  static final statsNumCompleted = const Key('__statsCompletedItems__');

  // Details Screen
  static final editTodoFab = const Key('__editTodoFab__');
  static final deleteTodoButton = const Key('__deleteTodoFab__');
  static final todoDetailsScreen = const Key('__todoDetailsScreen__');
  static final detailsTodoItemCheckbox = Key('DetailsTodo__Checkbox');
  static final detailsTodoItemTask = Key('DetailsTodo__Task');
  static final detailsTodoItemNote = Key('DetailsTodo__Note');

  // Add Screen
  static final addTodoScreen = const Key('__addTodoScreen__');
  static final saveNewTodo = const Key('__saveNewTodo__');
  static final taskField = const Key('__taskField__');
  static final noteField = const Key('__noteField__');

  // Add Garden Screen
  // TODO put all addGardenScreen's widgets id
  static final addGardenScreen = const Key('__addGardenScreen__');


  // Details Garden Screen
  // TODO put all detailsGardenScreen's widgets id
  static final detailsGardenScreen = const Key('__detailsGardenScreen__');


  // Discover Modelings Screen
  // TODO put all DiscoverModelings's widgets id


  // Edit Screen
  static final editTodoScreen = const Key('__editTodoScreen__');
  static final saveTodoFab = const Key('__saveTodoFab__');
}