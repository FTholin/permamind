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
          body: activeTab == AppTab.gardens ? FilteredGardens(

          ) : Stats(),
          floatingActionButton: FloatingActionButton(
            key: ArchSampleKeys.addGardenFab,
            onPressed: () {
              Navigator.pushNamed(context, ArchSampleRoutes.addGarden);
            },
            child: Icon(Icons.add),
            tooltip: ArchSampleLocalizations.of(context).addGarden,
          ),
          bottomNavigationBar: TabSelector(
            activeTab: activeTab,
            onTabSelected: (tab) => tabBloc.dispatch(UpdateTab(tab)),
          ),
        );
      },
    );
  }
}