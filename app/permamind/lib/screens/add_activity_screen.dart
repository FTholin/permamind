import 'package:arch/arch.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:Permamind/arch_bricks/arch_bricks.dart';
import 'package:Permamind/blocs/blocs.dart';

class ActivityAddedScreen extends StatefulWidget {
  final String gardenId;
  final String parcelId;

  ActivityAddedScreen({
    Key key,
    @required this.gardenId,
    @required this.parcelId,
  })  : assert(gardenId != null, parcelId != null),
        super(key: key ?? ArchSampleKeys.addTodoScreen);

  @override
  _ActivityAddedScreenState createState() => _ActivityAddedScreenState();
}

class _ActivityAddedScreenState extends State<ActivityAddedScreen> {
  final TextEditingController _activityNameController = TextEditingController();
  bool _activityNameValidate = false;

  final List<Map<String, String>> types = [
    {'fr_FR': 'Arrosage', 'en_US': 'Watering'},
    {'fr_FR': 'Semis', 'en_US': 'Sowing'},
    {'fr_FR': 'Repiquage/Plantation', 'en_US': 'Transplanting/Plantation'},
    {'fr_FR': 'Désherbage', 'en_US': 'Weeding'},
    {'fr_FR': 'Récolte', 'en_US': 'Harvest'},
    {'fr_FR': 'Faux semis', 'en_US': 'Stale seed bed'},
    {'fr_FR': 'Fertilisation', 'en_US': 'Fertilization'},
    {'fr_FR': 'Paillage', 'en_US': 'Mulching'},
    {'fr_FR': 'Diagnostique maladie', 'en_US': 'Disease diagnosis'},
  ];

  Map<String, String> activityTypeValue;

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
        body: Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.close,
                  size: 7 * SizeConfig.widthMultiplier,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          )),
          Flexible(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
              'assets/utils_image/tree.png',
                fit: BoxFit.scaleDown,
              ),
            ],
          )),
          Text("${AppLocalizations.of(context).addActivityTitle}",
              textAlign: TextAlign.left,
              maxLines: 2,
              style: TextStyle(
                  color: const Color(0xFF01534F),
                  fontSize: 2.5 * SizeConfig.textMultiplier,
                  fontWeight: FontWeight.bold
//                          fontWeight: FontWeight.bold,
                  )),
          TextFormField(
            controller: _activityNameController,
            textAlign: TextAlign.left,
            decoration: InputDecoration(
              hintText: "${AppLocalizations.of(context).ActivityAddedName}",
              errorText: _activityNameValidate
                  ? '${AppLocalizations.of(context).ActivityAddedNameError}'
                  : null,
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              _activityNameController.text.isEmpty
                  ? _activityNameValidate = true
                  : _activityNameValidate = false;
              setState(() {});
            },
          ),
          Text("${AppLocalizations.of(context).addActivityType}",
              textAlign: TextAlign.left,
              maxLines: 2,
              style: TextStyle(
                  color: const Color(0xFF01534F),
                  fontSize: 2.5 * SizeConfig.textMultiplier,
                  fontWeight: FontWeight.bold
//                          fontWeight: FontWeight.bold,
                  )),
          PopupMenuButton<Map<String, String>>(
            itemBuilder: (context) {
              return types.map((Map<String, String> item) {
                return PopupMenuItem<Map<String, String>>(
                  value: item,
                  child: Text('${item['${AppLocalizations.of(context).language}']}')
                );
              }).toList();
            },
            onSelected: (Map<String, String> newValue) {
              setState(() {
                activityTypeValue = newValue;
              });
            },
            child: Container(
              height: 6 * SizeConfig.heightMultiplier,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF01534F), width: 0.5),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
//                      mainAxisAlignment:
//                      MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child:
                    Text(activityTypeValue == null ? "${AppLocalizations.of(context).addActivityType}" : activityTypeValue['${AppLocalizations.of(context).language}'],
//                            textAlign:
//                            TextAlign.left,
                            style: TextStyle(
                              color: const Color(0xFF01534F),
                              fontSize: 2 * SizeConfig.textMultiplier,
//                          fontWeight: FontWeight.bold,
                            )),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(right: 3 * SizeConfig.widthMultiplier),
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      size: 7 * SizeConfig.widthMultiplier,
                      color: const Color(0xFF01534F),
                    ),
                  )
                ],
              ),
            ),
          ),
          Text("${AppLocalizations.of(context).addActivitySnooze}",
              textAlign: TextAlign.left,
              maxLines: 2,
              style: TextStyle(
                  color: const Color(0xFF01534F),
                  fontSize: 2.5 * SizeConfig.textMultiplier,
                  fontWeight: FontWeight.bold
//                          fontWeight: FontWeight.bold,
                  )),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFF01534F), width: 0.5),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: ListTile(
              leading: Icon(
                Icons.access_time,
                size: 24.0,
                semanticLabel:
                    '${AppLocalizations.of(context).ActivityAddedDaySelection}',
              ),
              title: Text('${new DateFormat.yMMMd().format(selectedDate)}'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () => _selectDate(context),
            ),
          ),
          InkWell(
            onTap: () async {
              if (_activityNameController.text.isNotEmpty && activityTypeValue.isNotEmpty) {


                DateTime referenceDate  = new DateTime(selectedDate.year, selectedDate.month, selectedDate.day, 1);

                BlocProvider.of<ActivitiesBloc>(context).add(
                    ActivityAdded(
                        Activity(
                            _activityNameController.text,
                            widget.gardenId,
                            widget.parcelId,
                            false,
                            referenceDate,
                            activityTypeValue['en_US'],
                            '',
                            null
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
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              height: 7 * SizeConfig.heightMultiplier,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Center(
                  child: Text("${AppLocalizations.of(context).addActivitySubmit}",
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFF9F9F9),
                        fontSize: 2.5 * SizeConfig.textMultiplier,
//                                             fontWeight: FontWeight.bold
                      )),
                )
              ),
            ),
          )
        ],
      ),
    ));
  }
}
