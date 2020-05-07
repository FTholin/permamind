import 'package:flutter/material.dart';
import 'package:Permamind/arch_bricks/arch_bricks.dart';
import 'package:data_repository/data_repository.dart';

class GardenDeletedSnackBar extends SnackBar {
  final ArchSampleLocalizations localizations;

  GardenDeletedSnackBar({
    Key key,
    @required Garden garden,
    @required VoidCallback onUndo,
    @required this.localizations
}) : super(
    key: key,
    content: Text(
      localizations.gardenDeleted(garden.name),
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