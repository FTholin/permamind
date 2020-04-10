import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:permamind/screens/screens.dart';
import 'package:permamind/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/models/models.dart';

class HomeScreen extends StatelessWidget {

  final DataRepository dataRepository;
  final User user;

   HomeScreen({Key key, this.dataRepository, this.user})
      : assert(dataRepository != null),
        assert(user != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
            title: activeTab == AppTab.gardens ? Text("${AppLocalizations.of(context).home}") : Text(""),
//            title:  Image.asset(
//              'assets/logo-light.png',
//              width:  MediaQuery.of(context).size.width / 2,
//              fit: BoxFit.contain,
//            ),
            actions: [
              activeTab == AppTab.gardens ? FlatButton(
                  child: Text(
                      "Ajouter",
                      style: TextStyle(
                          color: Colors.white,
//                        fontWeight: FontWeight.bold,
                          fontSize: 1.9 * SizeConfig.textMultiplier
                      )
                  ),
                  onPressed: () {
                    // SI accountStatus == 0 et gardenCounter <= 1
                    if (user.accountStatus == 0 && user.gardenCounter >= 1) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // TODO Peaufiner ce dialog pour le rentre propre
                          return AlertDialog(
                            title: new Text("Nombre de jardin dépassé"),
                            content: new Text("Passer à la version premium pour profiter pleinement de l'offre"),
                            actions: <Widget>[
                              // usually buttons at the bottom of the dialog
                              new FlatButton(
                                child: new Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Navigator.pushNamed(context, '/GardenAdded');
                    }
                  }
              ) :  FlatButton(
                child: Icon(Icons.settings, color: Colors.white,),
                onPressed: () => Navigator.pushNamed(
                  context,
                  '/settings',
                  arguments: SettingsScreenArguments(
                      user.id
                  ),
                ),
              )
//              ExtraActions(userId: user.id),

            ],
          ),
          body: _buildTabPage(context, activeTab),
//          floatingActionButton: _buildFloatActionButton(activeTab, context),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) => BlocProvider.of<TabBloc>(context).add(UpdateTab(tab)),
          ),
        );
      },
    );
  }


  Widget _buildTabPage(BuildContext context, AppTab activeTab) {
    switch (activeTab) {
      case AppTab.gardens:
        return EnumeratedGardens(dataRepository: dataRepository, user: user);
        break;
      case AppTab.abc:
        return Scaffold(
          body: Center(
            child: Text("${AppLocalizations.of(context).title}"),
          ),
        );
        break;
      case AppTab.learning:
        return EnumeratedTutorials();
        break;
      case AppTab.profile:
        return Scaffold(
          body: Center(
//            child: Text("👋 ${user.pseudo} !"),
            child: Column(
              children: <Widget>[
                Text("👋 ${user.pseudo} !"),
              ],
            )
          ),
        );
        break;
    }
  }


//  Widget _buildFloatActionButton(AppTab activeTab, context) {
//
//    if (activeTab == AppTab.gardens) {
//      return GardenSpeedDial(visible: true);
//    } else {
//      return GardenSpeedDial(visible: false);
//    }
//
//
//  }

}

