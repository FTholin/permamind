import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';

  typedef OnSaveCallback = Function(String task, String note);

  class AddEditActivityScreen extends StatefulWidget {
    final bool isEditing;
    final OnSaveCallback onSave;

    AddEditActivityScreen({
      Key key,
      @required this.onSave,
      @required this.isEditing,
    }) : super(key: key ?? ArchSampleKeys.addTodoScreen);

    @override
    _AddEditActivityScreenState createState() => _AddEditActivityScreenState();
  }

  class _AddEditActivityScreenState extends State<AddEditActivityScreen> {
//    static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    final TextEditingController _activityNameController = TextEditingController();
    bool _activityNameValidate = false;


    DateTime selectedDate = DateTime.now();

    Future<Null> _selectDate(BuildContext context) async {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: selectedDate,
          firstDate: DateTime(2020),
          lastDate: DateTime(2101));
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
        });
    }

    bool get isEditing => widget.isEditing;

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading:  IconButton(
            icon: new Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(null),
          ),
          title: Text("New Activity"),
          actions: <Widget>[
            IconButton(
  //            tooltip: localizations.deleteGarden,
              // TODO ArchSampleKeys
  //                key: ArchSampleKeys.deleteGardenButton,
              icon: Icon(Icons.check),
              onPressed: () async {
                if (_activityNameController.text.isNotEmpty) {



                  DateTime referenceDate  = new DateTime(selectedDate.year, selectedDate.month, selectedDate.day, 1);

                  BlocProvider.of<ActivitiesBloc>(context).add(
                    AddActivity(
                      Activity(
                        _activityNameController.text,
                        BlocProvider.of<ActivitiesBloc>(context).parcelId,
                        false,
                        referenceDate,
                        '',
                        ''
                      )
                    )
                  );
                  Navigator.pop(context, false);
                } else {
                  setState(() {
                    _activityNameController.text.isEmpty
                        ? _activityNameValidate = true
                        : _activityNameValidate = false;
                  });
                }
              },
            ),
          ],
        ),
        body: Column(
          children: <Widget>[

            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top:10.0),
                child: Form(
                  child: ListView(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: TextFormField(
                            controller: _activityNameController,
                            decoration: InputDecoration(
                              hintText: "Title",
                              errorText: _activityNameValidate ? 'Activity Name can\'t be empty' : null,
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              _activityNameController.text.isEmpty
                                  ? _activityNameValidate = true
                                  : _activityNameValidate = false;
                              setState(() {});
                            },
                          )
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Card(
                              child: ListTile(
                                leading: Icon(
                                  Icons.access_time,
                                  size: 24.0,
                                  semanticLabel: 'Select activity day',
                                ),
                                title: Text('${new DateFormat.yMMMd().format(selectedDate)}'),
                                trailing: Icon(Icons.keyboard_arrow_right),
                                onTap: () => _selectDate(context),
                              ),
                            ),
                        ),
                      ])),
            )
              )
          ],
        )
  //      body: Padding(
  //        padding: EdgeInsets.only(left: 20, right: 20, top:10.0),
  //        child: Container(
  //          color: Colors.red,
  //        ),
  //      )
      );
    }
  }