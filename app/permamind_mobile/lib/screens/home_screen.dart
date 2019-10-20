import 'package:flutter/material.dart';
import 'package:permamind_mobile/widgets/widgets.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:permamind_mobile/models/models.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final tabBloc = BlocProvider.of<TabBloc>(context);
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
              FilterButton(visible: activeTab == AppTab.gardens),
              ExtraActions(),
            ],
          ),
          body: _buildTabPage(activeTab),
          floatingActionButton: _buildFloatActionButton(activeTab, context),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) => tabBloc.dispatch(UpdateTab(tab)),
          ),
        );
      },
    );
  }
}

Widget _buildTabPage(AppTab activeTab) {
  switch (activeTab) {
    case AppTab.gardens:
      return FilteredGardens();
      break;
    case AppTab.abc:
      return Scaffold(
        body: Center(
          child: Text("ABCédaire des plantes..."),
        ),
      );
      break;
    case AppTab.learning:
      return EnumeratedTutorials();
      break;
    case AppTab.settings:
      return Scaffold(
        body: Center(
          child: Text("Settings..."),
        ),
      );
      break;
  }
}


Widget _buildFloatActionButton(AppTab activeTab, context) {
  switch (activeTab) {
    case AppTab.gardens:
      return FloatingActionButton(
        key: ArchSampleKeys.addGardenFab,
        onPressed: () {
          Navigator.pushNamed(context, ArchSampleRoutes.addGarden);
        },
        child: Icon(Icons.add),
        tooltip: ArchSampleLocalizations.of(context).addGarden,
      );
      break;
    case AppTab.abc:
      return null;
      break;
    case AppTab.learning:
      return null;
      break;
    case AppTab.settings:
      return null;
      break;
  }
}

