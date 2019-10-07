import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/screens/screens.dart';
import 'package:data_repository/data_repository.dart';

class AddEditGardenScreen extends StatefulWidget {
  final bool isEditing;
  final Garden garden;


  AddEditGardenScreen({Key key, @required this.isEditing, this.garden})
      : super(key: key ?? ArchSampleKeys.addTodoScreen);

  @override
  _AddEditGardenScreenState createState() => _AddEditGardenScreenState();
}

class _AddEditGardenScreenState extends State<AddEditGardenScreen> {

  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _gardenNameController = TextEditingController();


  final String _publicTitle = "Public";

  final String _privateTitle = "Private";

  final String _privateParagraph = "Private gardens are accessible by invitation only and are not displayed on the map";

  final String _publicParagraph = "Public gardens are accessible and are  displayed on the map";

  bool _validate = false;

  bool _gardenVisibility = false;

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
                      margin: const EdgeInsets.only(left: 15),
                      width: MediaQuery.of(context).size.width,
                      child: Text("Garden's Name",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 20))),
                ),
                Flexible(
                  flex: 3,
                    child: TextField(
                      controller: _gardenNameController,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 15.0, top: 30),
                          border: OutlineInputBorder(),
                          hintText: "Enter a Garden's name",
                          errorText: _validate ? 'Value Can\'t Be Empty' : null,
                      ),
                      onChanged: (value){
                        _gardenNameController.text.isEmpty ? _validate = true : _validate = false;
                        setState(() {});
                      },
                    ),
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
                      title: Text("${_gardenVisibility == false ? _privateTitle : _publicTitle}",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 20)),
                      value: _gardenVisibility,
                      onChanged: (bool value) {
                        setState(() {
                          _gardenVisibility = value;
                        });
                      },
                    ),
                  ),
                  Flexible(
                    child: Container(
                        color: Colors.indigoAccent,
                        margin: const EdgeInsets.only(left: 15, right: 20),
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                            "${_gardenVisibility == false ? _privateParagraph : _publicParagraph}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 14)),
                    ),
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
                      child: Text("Send invitations to",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 20))),
                ),
                Flexible(
                  flex: 3,
                  // TODO Ajouter Chip Input ici
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15.0, top: 30),
                      border: OutlineInputBorder(),
                      hintText: "Invite some friends to have fun !",
//                      errorText: _validate ? 'Value Can\'t Be Empty' : null,
                    ),
                    onChanged: (value){
                      setState(() {});
                    },
                  ),
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
              onPressed:() {

                if (_gardenNameController.text.isNotEmpty) {
                  Navigator.pushNamed(context,
                    ArchSampleRoutes.discoverModelings,
                    arguments: ModelingsScreenArguments(
                        '${_gardenNameController.text}',
                        _gardenVisibility
                    ),
                  );
                } else {
                  setState(() {
                    _gardenNameController.text.isEmpty ? _validate = true : _validate = false;
                  });
                }
              },
              child: Text("Continue"),
            )
          )
        ],
      ),
    );
  }
}
