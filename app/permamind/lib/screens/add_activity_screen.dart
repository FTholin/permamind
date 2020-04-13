import 'package:arch/arch.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';

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
    {'nameFr': 'Arrosage', 'nameEn': 'Watering'},
    {'nameFr': 'Semis', 'nameEn': 'Sowing'},
    {'nameFr': 'Repiquage/Plantation', 'nameEn': 'Transplanting/Plantation'},
    {'nameFr': 'Désherbage', 'nameEn': 'Weeding'},
    {'nameFr': 'Récolte', 'nameEn': 'Harvest'},
    {'nameFr': 'Faux semis', 'nameEn': 'Stale seed bed'},
    {'nameFr': 'Fertilisation', 'nameEn': 'Fertilization'},
    {'nameFr': 'Paillage', 'nameEn': 'Mulching'},
    {'nameFr': 'Diagnostique maladie', 'nameEn': 'Disease diagnosis'},
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
                // TODO Changer internationalisation

              'assets/utils_image/tree.png',
                fit: BoxFit.scaleDown,
              ),
            ],
          )),
          // TODO Changer internationalisation

          Text("Titre de la nouvelle activité ?",
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
          // TODO Changer internationalisation
          Text("Type d'activité ?",
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
                  // TODO Changer ici avec l'internationalisation
                  child: Text(item['nameFr']),
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
                    // TODO Changer internationalisation
                    Text(activityTypeValue == null ? "Type d'activité" : activityTypeValue['nameFr'],
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
          // TODO Changer internationalisation
          Text("Quand souhaitez vous la réaliser ?",
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
                            activityTypeValue['nameEn'],
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
                // TODO Changer internationalisation
                child: Center(
                  child: Text("Soumettre l'activité",
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
