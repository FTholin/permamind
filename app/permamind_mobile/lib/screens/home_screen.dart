import 'package:authentication/authentication.dart';
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
            title: Text(FlutterBlocLocalizations.of(context).appTitle),
            actions: [
              FilterButton(visible: activeTab == AppTab.todos),

              ExtraActions(),
            ],
          ),
          body: activeTab == AppTab.todos ? FilteredTodos() : Stats(),
          floatingActionButton: FloatingActionButton(
            key: ArchSampleKeys.addParcelFab,
            onPressed: () {
              Navigator.pushNamed(context, ArchSampleRoutes.addParcel);
            },
            child: Icon(Icons.add),
            tooltip: ArchSampleLocalizations.of(context).addParcel,
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