import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:data_repository/data_repository.dart';


//typedef OnSaveCallback = Function(String task, String note);
//
//class AddEditScreen extends StatefulWidget {
//
//  final bool isEditing;
//  final OnSaveCallback onSave;
//  final Garden garden;
//
//  AddEditScreen({
//    Key key,
//    @required this.onSave,
//    @required this.isEditing,
//    this.garden
//}) : super(key: key ?? ArchSampleKeys.addGardenScreen);
//
//  @override
//  _AddEditScreenState createState() => _AddEditScreenState();
//}
//
//class _AddEditScreenState extends State<AddEditScreen> {
//  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//
//  String _task;
//  String _note;
//
//  bool get isEditing => widget.isEditing;
//
//  @override
//  Widget build(BuildContext context) {
//    final localizations = ArchSampleLocalizations.of(context);
//    final textTheme = Theme.of(context).textTheme;
//
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(
//          isEditing ? localizations.editGarden : localizations.addGarden,
//        )
//      ),
//      body: Padding(
//        padding: EdgeInsets.all(16.0),
//        child: Form(
//          key: _formKey,
//          child: ListView(
//            children: <Widget>[
//              TextFormField(
//                initialValue: isEditing ? widget.garden.task : '',
//                key: ArchSampleKeys.taskField,
//                autofocus: !isEditing,
//                style: textTheme.headline,
//                decoration: InputDecoration(
//                  hintText: localizations.newGardenHint,
//                ),
//                validator: (val) {
//                  return val.trim().isEmpty
//                      ? localizations.emptyGardenError
//                      : null;
//                },
//                onSaved: (value) => _task = value,
//              ),
//              TextFormField(
//                initialValue: isEditing ? widget.garden.note : '',
//                key: ArchSampleKeys.noteField,
//                maxLines: 10,
//                style: textTheme.subhead,
//                decoration: InputDecoration(
//                  hintText: localizations.notesHint,
//                ),
//                onSaved: (value) => _note = value,
//              )
//            ],
//          ),
//        ),
//      ),
//      floatingActionButton: FloatingActionButton(
//          key: isEditing ? ArchSampleKeys.saveGardenFab : ArchSampleKeys.saveNewGarden,
//          tooltip: isEditing ? localizations.saveChanges : localizations.addGarden,
//          child: Icon(isEditing ? Icons.check : Icons.add),
//          onPressed: () {
//            if (_formKey.currentState.validate()) {
//              _formKey.currentState.save();
//              widget.onSave(_task, _note);
//              Navigator.pop(context);
//            }
//          }),
//    );
//  }
//}