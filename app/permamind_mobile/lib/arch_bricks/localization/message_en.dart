import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = MessageLookup();

// ignore: unused_element
final _keepAnalysisHappy = Intl.defaultLocale;

// ignore: non_constant_identifier_names
typedef MessageIfAbsent(String message_str, List args);

class MessageLookup extends MessageLookupByLibrary {
  get localeName => 'en';

  static m0(task) => "Deleted \"${task}\"";

  final messages = _notInlinedMessages(_notInlinedMessages);

  static _notInlinedMessages(_) => {
    "activeTodos": MessageLookupByLibrary.simpleMessage("Active Todos"),
    "addTodo": MessageLookupByLibrary.simpleMessage("Add Todo"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "clearCompleted":
    MessageLookupByLibrary.simpleMessage("Clear completed"),
    "completedTodos":
    MessageLookupByLibrary.simpleMessage("Completed Todos"),
    "delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "deleteTodo": MessageLookupByLibrary.simpleMessage("Delete Todo"),
    "deleteTodoConfirmation":
    MessageLookupByLibrary.simpleMessage("Delete this todo?"),
    "editTodo": MessageLookupByLibrary.simpleMessage("Edit Todo"),
    "emptyTodoError":
    MessageLookupByLibrary.simpleMessage("Please enter some text"),
    "filterTodos": MessageLookupByLibrary.simpleMessage("Filter Todos"),
    "markAllComplete":
    MessageLookupByLibrary.simpleMessage("Mark all complete"),
    "markAllIncomplete":
    MessageLookupByLibrary.simpleMessage("Mark all incomplete"),
    "newTodoHint":
    MessageLookupByLibrary.simpleMessage("What needs to be done?"),
    "notesHint":
    MessageLookupByLibrary.simpleMessage("Additional Notes..."),
    "saveChanges": MessageLookupByLibrary.simpleMessage("Save changes"),
    "showActive": MessageLookupByLibrary.simpleMessage("Show Active"),
    "showAll": MessageLookupByLibrary.simpleMessage("Show All"),
    "showCompleted": MessageLookupByLibrary.simpleMessage("Show Completed"),
    "stats": MessageLookupByLibrary.simpleMessage("Stats"),
    "todoDeleted": m0,
    "todoDetails": MessageLookupByLibrary.simpleMessage("Todo Details"),
    "todos": MessageLookupByLibrary.simpleMessage("Todos"),
    "undo": MessageLookupByLibrary.simpleMessage("Undo")
  };
}
