import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/models/models.dart';
import 'package:data_repository/data_repository.dart';

//class GardenItem extends StatelessWidget {
//  final DismissDirectionCallback onDismissed;
//  final GestureTapCallback onTap;
//  final ValueChanged<bool> onCheckboxChanged;
//  final Garden garden;
//
//  GardenItem({
//    Key key,
//    @required this.onDismissed,
//    @required this.onTap,
//    @required this.onCheckboxChanged,
//    @required this.garden,
//}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//
//    return ListTile(
//      title: Text("Coucou"),
//    );
////    return Dismissible(
////      key: ArchSampleKeys.gardenItem(garden.id),
////      onDismissed: onDismissed,
////      child: ListTile(
////        onTap: onTap,
////        leading: Checkbox(
////            key: ArchSampleKeys.gardenItemCheckbox(garden.id),
////            value: garden.complete,
////            onChanged: onCheckboxChanged
////        ),
////        title: Hero(
////          tag: '${garden.id}__heroTag',
////          child: Container(
////            width: MediaQuery.of(context).size.width,
////            child: Text(
////              garden.task,
////              key: ArchSampleKeys.gardenItemTask(garden.id),
////              style: Theme.of(context).textTheme.title,
////            ),
////          ),
////        ),
////        subtitle: garden.note.isEmpty ?
////        Text(
////          garden.note,
////          key: ArchSampleKeys.gardenItemNote(garden.id),
////          maxLines: 1,
////          overflow: TextOverflow.ellipsis,
////          style: Theme.of(context).textTheme.subhead,
////        )
////            : null,
////      ),
////    );
//  }
//}