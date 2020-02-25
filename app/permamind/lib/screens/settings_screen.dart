import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
//                            '${AppLocalizations.of(context).addActivityDaySelection}',
//                      ),
//                      title: Text('Nous contacter'),
//                      onTap: () {},
//                    ),
//                  ),

                    Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.language,
                          size: 24.0,
                          semanticLabel:
                          '${AppLocalizations.of(context).addActivityDaySelection}',
                        ),
                        title: Text('Changer la langue'),
                        onTap: () {},
                      ),
                    ),

                    Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.description,
                          size: 24.0,
                          semanticLabel:
                          '${AppLocalizations.of(context).addActivityDaySelection}',
                        ),
                        title: Text("Conditions d'utilisation"),
                        onTap: () {},
                      ),
                    ),

                    Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.favorite,
                          size: 24.0,
                          semanticLabel:
                          '${AppLocalizations.of(context).addActivityDaySelection}',
                        ),
                        title: Text("Aknowledgements"),
                        onTap: () {},
                      ),
                    ),

                    Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.directions_run,
                          size: 24.0,
                          semanticLabel:
                          '${AppLocalizations.of(context).addActivityDaySelection}',
                        ),
                        title: Text("Supprimer compte"),
                        onTap: () {
                          return showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Suppression de votre compte'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text("Message informatif pour informer l'user"),
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
                                    onPressed: () {
                                      BlocProvider.of<AuthenticationBloc>(context).add(DeletedAccount(userId));
                                      Navigator.pop(context);
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