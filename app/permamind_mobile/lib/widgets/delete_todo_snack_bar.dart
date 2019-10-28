import 'package:flutter/material.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:data_repository/data_repository.dart';

class DeleteTodoSnackBar extends SnackBar {
  final ArchSampleLocalizations localizations;

  DeleteTodoSnackBar({
    Key key,
    @required Garden garden,
    @required VoidCallback onUndo,
    @required this.localizations
}) : super(
    key: key,
    content: Text(
      localizations.todoDeleted(garden.gardenName),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
    duration: Duration(seconds: 5),
    action: SnackBarAction(
        label: localizations.undo,
        onPressed: onUndo
    )
  );
}