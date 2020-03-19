import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
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
            title: Text("Mes jardins"),
//            title:  Image.asset(
//              'assets/logo-light.png',
//              width:  MediaQuery.of(context).size.width / 2,
//              fit: BoxFit.contain,
//            ),
            actions: [
//              FilterButton(visible: activeTab == AppTab.gardens),
              ExtraActions(userId: user.id),
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
            child: Text("👋 ${user.pseudo} !"),
          ),
        );
        break;
    }
  }


  Widget _buildFloatActionButton(AppTab activeTab, context) {

    if (activeTab == AppTab.gardens) {
      return GardenSpeedDial(visible: true);
    } else {
      return GardenSpeedDial(visible: false);
    }
//  switch (activeTab) {
//    case AppTab.gardens:
//
//
////      return FloatingActionButton(
////        key: ArchSampleKeys.addGardenFab,
////        onPressed: () {
////          Navigator.pushNamed(context, ArchSampleRoutes.addGarden);
////        },
////        child: Icon(Icons.add, color: Colors.white),
////        tooltip: ArchSampleLocalizations.of(context).addGarden,
////      );
//      return GardenSpeedDial(visible: true);
//      break;
//    case AppTab.abc:
//      return GardenSpeedDial(visible: false);
//      break;
//    case AppTab.learning:
//      return GardenSpeedDial(visible: false);
//      break;
//    case AppTab.profile:
//      return GardenSpeedDial(visible: false);
//      break;

  }

}

