import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'message_all.dart';


class ArchSampleLocalizations {
  ArchSampleLocalizations(this.locale);

  final Locale locale;

  static Future<ArchSampleLocalizations> load(Locale locale) {
    return initializeMessages(locale.toString()).then((_) {
      return ArchSampleLocalizations(locale);
    });
  }

  static ArchSampleLocalizations of(BuildContext context) {
    return Localizations.of<ArchSampleLocalizations>(
        context, ArchSampleLocalizations);
  }

  String get todos => Intl.message(
    'Todos',
    name: 'todos',
    args: [],
    locale: locale.toString(),
  );

  String get gardens => Intl.message(
    'Gardens',
    name: 'gardens',
    args: [],
    locale: locale.toString(),
  );

  String get abc => Intl.message(
    'ABC',
    name: 'abc',
    args: [],
    locale: locale.toString(),
  );

  String get learning => Intl.message(
    'Learning',
    name: 'learning',
    args: [],
    locale: locale.toString(),
  );

  String get profile => Intl.message(
    'Profile',
    name: 'profile',
    args: [],
    locale: locale.toString(),
  );

  String get stats => Intl.message(
    'Stats',
    name: 'stats',
    args: [],
    locale: locale.toString(),
  );

  String get showAll => Intl.message(
    'Show All',
    name: 'showAll',
    args: [],
    locale: locale.toString(),
  );

  String get showActive => Intl.message(
    'Show Active',
    name: 'showActive',
    args: [],
    locale: locale.toString(),
  );

  String get showCompleted => Intl.message(
    'Show Completed',
    name: 'showCompleted',
    args: [],
    locale: locale.toString(),
  );

  String get newTodoHint => Intl.message(
    'What needs to be done?',
    name: 'newTodoHint',
    args: [],
    locale: locale.toString(),
  );

  String get markAllComplete => Intl.message(
    'Mark all complete',
    name: 'markAllComplete',
    args: [],
    locale: locale.toString(),
  );

  String get markAllIncomplete => Intl.message(
    'Mark all incomplete',
    name: 'markAllIncomplete',
    args: [],
    locale: locale.toString(),
  );

  String get clearCompleted => Intl.message(
    'Clear completed',
    name: 'clearCompleted',
    args: [],
    locale: locale.toString(),
  );

  String get logOut => Intl.message(
    'Log out',
    name: 'logOut',
    args: [],
    locale: locale.toString()
  );

  String get settings => Intl.message(
      'Settings',
      name: 'settings',
      args: [],
      locale: locale.toString()
  );

  String get addTodo => Intl.message(
    'Add Todo',
    name: 'addTodo',
    args: [],
    locale: locale.toString(),
  );

  String get addGarden => Intl.message(
    'Add Garden',
    name: 'addGarden',
    args: [],
    locale: locale.toString(),
  );

  String get editTodo => Intl.message(
    'Edit Todo',
    name: 'editTodo',
    args: [],
    locale: locale.toString(),
  );

  String get saveChanges => Intl.message(
    'Save changes',
    name: 'saveChanges',
    args: [],
    locale: locale.toString(),
  );

  String get filterTodos => Intl.message(
    'Filter Todos',
    name: 'filterTodos',
    args: [],
    locale: locale.toString(),
  );

  String get filterGardens => Intl.message(
    'Filter Gardens',
    name: 'filterGardens',
    args: [],
    locale: locale.toString(),
  );

  String get deleteTodo => Intl.message(
    'Delete Todo',
    name: 'deleteTodo',
    args: [],
    locale: locale.toString(),
  );

  String get deleteGarden => Intl.message(
    'Delete Garden',
    name: 'deleteGarden',
    args: [],
    locale: locale.toString(),
  );


  String get todoDetails => Intl.message(
    'Todo Details',
    name: 'todoDetails',
    args: [],
    locale: locale.toString(),
  );

  String get emptyTodoError => Intl.message(
    'Please enter some text',
    name: 'emptyTodoError',
    args: [],
    locale: locale.toString(),
  );

  String get notesHint => Intl.message(
    'Additional Notes...',
    name: 'notesHint',
    args: [],
    locale: locale.toString(),
  );

  String get completedTodos => Intl.message(
    'Completed Todos',
    name: 'completedTodos',
    args: [],
    locale: locale.toString(),
  );

  String get activeTodos => Intl.message(
    'Active Todos',
    name: 'activeTodos',
    args: [],
    locale: locale.toString(),
  );

  String gardenDeleted(String task) => Intl.message(
    'Deleted "$task"',
    name: 'gardenDeleted',
    args: [task],
    locale: locale.toString(),
  );

  String get undo => Intl.message(
    'Undo',
    name: 'undo',
    args: [],
    locale: locale.toString(),
  );

  String get deleteTodoConfirmation => Intl.message(
    'Delete this todo?',
    name: 'deleteTodoConfirmation',
    args: [],
    locale: locale.toString(),
  );

  String get delete => Intl.message(
    'Delete',
    name: 'delete',
    args: [],
    locale: locale.toString(),
  );

  String get cancel => Intl.message(
    'Cancel',
    name: 'cancel',
    args: [],
    locale: locale.toString(),
  );
}

class ArchSampleLocalizationsDelegate
    extends LocalizationsDelegate<ArchSampleLocalizations> {
  @override
  Future<ArchSampleLocalizations> load(Locale locale) =>
      ArchSampleLocalizations.load(locale);

  @override
  bool shouldReload(ArchSampleLocalizationsDelegate old) => false;

  @override
  bool isSupported(Locale locale) =>
      locale.languageCode.toLowerCase().contains("en");
}