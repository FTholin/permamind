import 'package:arch/arch.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';


  class AddActivityScreen extends StatefulWidget {
    final String gardenId;

    AddActivityScreen({
      Key key,
      @required this.gardenId,
    }) : assert(gardenId != null), super(key: key ?? ArchSampleKeys.addTodoScreen);

    @override
    _AddActivityScreenState createState() => _AddActivityScreenState();
  }

  class _AddActivityScreenState extends State<AddActivityScreen> {

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


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          leading:  IconButton(
            icon: new Icon(Icons.close),
            onPressed: () => Navigator.of(context).pop(null),
          ),
          title: Text("${AppLocalizations.of(context).addActivityTitle}"),
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
                        widget.gardenId,
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
                              hintText: "${AppLocalizations.of(context).addActivityName}",
                              errorText: _activityNameValidate ? '${AppLocalizations.of(context).addActivityNameError}' : null,
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
                                  semanticLabel: '${AppLocalizations.of(context).addActivityDaySelection}',
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