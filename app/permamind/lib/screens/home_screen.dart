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
            title: showTabTitle(activeTab, context),
            actions: [actionButton(activeTab, context)]
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
      case AppTab.learning:
        return EnumeratedTutorials();
        break;
      case AppTab.profile:
        return Profile(dataRepository: dataRepository, user: user);
        default:
          return EnumeratedGardens(dataRepository: dataRepository, user: user);
          break;
    }
  }

  Widget showTabTitle(AppTab activeTab, BuildContext context) {
    switch(activeTab) {
      case AppTab.gardens:
        return Text("${AppLocalizations.of(context).home}");
      break;

      case AppTab.learning:
        return Text("${AppLocalizations.of(context).learningTitle}");
        break;

      case AppTab.profile:
        return Text("${AppLocalizations.of(context).profileTitle}");
        break;

      default:
        return Text("${AppLocalizations.of(context).home}");
        break;
    }
  }


  Widget actionButton(AppTab activeTab, BuildContext context) {
    switch(activeTab) {
      case AppTab.gardens:

        return IconButton(
          icon: Icon(Icons.add),
          tooltip: 'add new garden',
          onPressed: () {
            // SI accountStatus == 0 et gardenCounter <= 1
            if (user.accountStatus == 0 && user.gardenCounter >= 1) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: new Text("${AppLocalizations.of(context).premiumDialogTitle}"),
                    content: new Text("${AppLocalizations.of(context).premiumDialogContent}"),
                    actions: <Widget>[
                      // usually buttons at the bottom of the dialog
                      new FlatButton(
                        child: new Text("${AppLocalizations.of(context).close}"),
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
          },
        );
        break;

      case AppTab.learning:
        return Container();
        break;

      case AppTab.profile:
        return FlatButton(
          child: Icon(Icons.settings, color: Colors.white,),
          onPressed: () => Navigator.pushNamed(
            context,
            '/settings',
            arguments: SettingsScreenArguments(
                user.id
            ),
          ),
        );
        break;

      default:
        return FlatButton(
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
                    return AlertDialog(
                      title: new Text("${AppLocalizations.of(context).premiumDialogTitle}"),
                      content: new Text("${AppLocalizations.of(context).premiumDialogContent}"),
                      actions: <Widget>[
                        // usually buttons at the bottom of the dialog
                        new FlatButton(
                          child: new Text("${AppLocalizations.of(context).close}"),
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
        );
        break;
    }
  }


}

