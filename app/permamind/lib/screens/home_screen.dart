import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:permamind/widgets/widgets.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/models/models.dart';

class HomeScreen extends StatelessWidget {

  final DataRepository _dataRepository;

  HomeScreen({Key key, @required DataRepository dataRepository})
      : assert(dataRepository != null),
        _dataRepository = dataRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, AppTab>(
      builder: (context, activeTab) {
        return Scaffold(
          appBar: AppBar(
            title:  Image.asset(
              'assets/logo-light.png',
              width:  MediaQuery.of(context).size.width / 2,
              fit: BoxFit.contain,
            ),
            actions: [
//              FilterButton(visible: activeTab == AppTab.gardens),
              Container(),
              ExtraActions(),
            ],
          ),
          body: _buildTabPage(activeTab),
          floatingActionButton: _buildFloatActionButton(activeTab, context),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) => BlocProvider.of<TabBloc>(context).add(UpdateTab(tab)),
          ),
        );
      },
    );
  }


  Widget _buildTabPage(AppTab activeTab) {
    switch (activeTab) {
      case AppTab.gardens:
        return EnumeratedGardens(dataRepository: _dataRepository);
        break;
      case AppTab.abc:
        return Scaffold(
          body: Center(
            child: Text("Plants encyclopedia..."),
          ),
        );
        break;
      case AppTab.learning:
        return EnumeratedTutorials();
        break;
      case AppTab.profile:
        return Scaffold(
          body: Center(
            child: Text("Profile..."),
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

