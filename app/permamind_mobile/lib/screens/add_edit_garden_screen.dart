import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:todos_repository/todos_repository.dart';

class AddEditGardenScreen extends StatefulWidget {
  final bool isEditing;
  final Todo todo;

  AddEditGardenScreen({Key key, @required this.isEditing, this.todo})
      : super(key: key ?? ArchSampleKeys.addTodoScreen);

  @override
  _AddEditGardenScreenState createState() => _AddEditGardenScreenState();
}

class _AddEditGardenScreenState extends State<AddEditGardenScreen> {
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _task;
  String _note;

  bool _lights = false;

  bool get isEditing => widget.isEditing;

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text("New garden"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
//                color: Colors.indigoAccent,
                      margin: const EdgeInsets.only(left: 15),
                      width: MediaQuery.of(context).size.width,
                      child: Text("Garden's Name",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 20))),
                ),
                Flexible(
                    child: TextField(
                        decoration:
                        InputDecoration(border: OutlineInputBorder())),
                ),
              ],
            ),
          ),
          Flexible(
            child: Container(
//              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: SwitchListTile(
                      title: Text("Public",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 20)),
                      value: _lights,
                      onChanged: (bool value) {
                        setState(() {
                          _lights = value;
                        });
                      },
                    ),
                  ),
                  Flexible(
                    child: Container(
                        color: Colors.indigoAccent,
                        margin:
                            const EdgeInsets.only(left: 15, right: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                            "Private gardens are accessible by invitation only and are not displayed on the map",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 14))),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
            ),
          ),
          Flexible(
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 2,
                  child: Container(
//                color: Colors.indigoAccent,
                      margin: const EdgeInsets.only(left: 15),
                      width: MediaQuery.of(context).size.width,
                      child: Text("Send invitations to (optional)",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 20))),
                ),
                Flexible(
                  child: TextField(
                      decoration:
                      InputDecoration(border: OutlineInputBorder())),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 3,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              onPressed: ,
              child: Text("Choose a modelling",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 20)),
            )
          )
        ],
      ),
    );
  }
}
