import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/screens/home_screen.dart';

class SettingsScreen extends StatelessWidget {

  final String userId;

  SettingsScreen(this.userId);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
                "${AppLocalizations.of(context).extraActionsSettingsButton}")),
        body: Column(
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 10.0),
              child: Form(
                  child: ListView(children: <Widget>[
//                  Card(
//                    child: ListTile(
//                      leading: Icon(
//                        Icons.mail,
//                        size: 24.0,
//                        semanticLabel:
//                            '${AppLocalizations.of(context).ActivityAddedDaySelection}',
//                      ),
//                      title: Text('Nous contacter'),
//                      onTap: () {},
//                    ),
//                  ),

//                    Card(
//                      child: ListTile(
//                        leading: Icon(
//                          Icons.language,
//                          size: 24.0,
//                          semanticLabel:
//                          '${AppLocalizations.of(context).ActivityAddedDaySelection}',
//                        ),
//                        title: Text('Changer la langue'),
//                        onTap: () {},
//                      ),
//                    ),

                    Card(
                      color: Colors.green,
                      child: ListTile(
                        leading: Icon(
                          Icons.description,
                          size: 24.0,
                          color: Colors.white,
                        ),
                        title: Text("${AppLocalizations.of(context).appSettingsCgu}", style: TextStyle(color: Colors.white),),
                        onTap: () => Navigator.pushNamed(context, '/eula'),

                      ),
                    ),

                    Card(
                      color: Colors.green,
                      child: ListTile(
                        leading: Icon(
                          Icons.favorite,
                          size: 24.0,
                          color: Colors.white,

                        ),
                        title: Text("${AppLocalizations.of(context).appSettingsThanks}", style: TextStyle(color: Colors.white)),
                        onTap: () => Navigator.pushNamed(context, '/acknowledgement'),

                      ),
                    ),
                    Card(
                      color: Colors.green,
                      child: ListTile(
                        leading: Icon(
                          Icons.exit_to_app,
                          size: 24.0,
                          color: Colors.white,
                        ),
                        title: Text("${AppLocalizations.of(context).extraActionsLogOutButton}",  style: TextStyle(color: Colors.white)),
                        onTap: () {
                          return showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('${AppLocalizations.of(context).appSettingsDisconnectTitle}'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text("${AppLocalizations.of(context).appSettingsDisconnectContent}"),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('${AppLocalizations.of(context).buttonCancel}'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text('${AppLocalizations.of(context).buttonContinue}',),
                                    onPressed: () {
                                      BlocProvider.of<AuthenticationBloc>(context).add(LoggedOut());

                                      Navigator.of(context).pushNamedAndRemoveUntil(
                                          '/', (Route<dynamic> route) => false
                                      );

                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Card(
                      color: Colors.green,
                      child: ListTile(
                        leading: Icon(
                          Icons.directions_run,
                          size: 24.0,
                          color: Colors.white,
                        ),
                        title: Text("${AppLocalizations.of(context).appSettingsDeleteAccountTitle}", style: TextStyle(color: Colors.white)),
                        onTap: () {
                          return showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('${AppLocalizations.of(context).appSettingsDeleteAccountTitle}'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text("${AppLocalizations.of(context).appSettingsDeleteAccountContent}"),
                                    ],
                                  ),
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                    child: Text('${AppLocalizations.of(context).buttonCancel}'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  FlatButton(
                                    child: Text('${AppLocalizations.of(context).buttonContinue}'),
                                    onPressed: () async {
                                      BlocProvider.of<AuthenticationBloc>(context).add(DeletedAccount(userId));

                                      Navigator.of(context).pushNamedAndRemoveUntil(
                                          '/', (Route<dynamic> route) => false
                                      );

                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),

              ])),
            ))
          ],
        ));
  }
}


class SettingsScreenArguments {
  final String userId;
  SettingsScreenArguments(this.userId);
}