import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:permamind_mobile/widgets/widgets.dart';

//typedef OnSaveCallback = Function(String task, String note);

class DiscoverModelingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final gardenBloc = BlocProvider.of<GardensBloc>(context);
    final localizations = ArchSampleLocalizations.of(context);

    final ModelingsScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
          title: Text("${args.gardenName}")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            flex: 3,
            child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                    '${FlutterBlocLocalizations.of(context).modelingsName}',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32))),
          ),
          Flexible(
            flex: 2,
            child: Column(
              children: <Widget>[
                Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                      child: Row(
                        children: <Widget>[
                          Container(
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                            padding: EdgeInsets.only(left: 10),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                    '${FlutterBlocLocalizations.of(context).tendencyHeader}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                        fontSize: 20))),
          ),
          Flexible(
            flex: 9,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              color: Colors.blue,
              child: BlocBuilder<ModelingsBloc, ModelingsState>(
                  builder: (context, state) {
                if (state is ModelingsLoading) {
                  // TODO ArchSampleKeys
                  return LoadingIndicator(key: ArchSampleKeys.todosLoading);
                } else if (state is ModelingsLoaded) {
                  final modelings = state.modelingsFetched;
                  return FilteredModelings(
                    modelings: modelings,
                    gardenName: args.gardenName,
                    gardenVisibility: args.gardenVisibility,
                    gardenMembers: args.gardenMembers
                  );
                } else {
                  // TODO ArchSampleKeys
                  return Container(
                      key: FlutterTodosKeys.filteredTodosEmptyContainer);
                }
              }),
            ),
          ),
          Flexible(
            flex: 2,
            child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                child: Text(
                    '${FlutterBlocLocalizations.of(context).browseAllModelings}',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20))),
          ),
          Flexible(
            flex: 9,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              color: Colors.blue,
              child: BlocBuilder<ModelingsBloc, ModelingsState>(
                  builder: (context, state) {
                if (state is ModelingsLoading) {
                  // TODO ArchSampleKeys
                  return LoadingIndicator(key: ArchSampleKeys.todosLoading);
                } else if (state is ModelingsLoaded) {
                  final modelings = state.modelingsFetched;
                  return FilteredModelings(
                    modelings: modelings,
                    gardenName: args.gardenName,
                    gardenVisibility: args.gardenVisibility,
                    gardenMembers: args.gardenMembers,
                  );
//                  return FilteredModelings(
//                      modelings: modelings,
//                      gardenName: ${args.gardenName},
//                      publicVisibility: ${args.gardenVisibility});
                } else {
                  return Container(
                    // TODO ArchSampleKeys
                  key: FlutterTodosKeys.filteredTodosEmptyContainer);
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}

class ModelingsScreenArguments {
  final String gardenName;
  final bool gardenVisibility;
  final List<String> gardenMembers;
  ModelingsScreenArguments(this.gardenName, this.gardenVisibility, this.gardenMembers);
}
