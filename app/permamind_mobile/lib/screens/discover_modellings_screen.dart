import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:permamind_mobile/widgets/widgets.dart';
import 'package:todos_repository/todos_repository.dart';

//typedef OnSaveCallback = Function(String task, String note);

class DiscoverModellingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todosBloc = BlocProvider.of<TodosBloc>(context);
    final localizations = ArchSampleLocalizations.of(context);

    final ModellingsScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
//        title: Text("Choose a modelling"),
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
                    '${FlutterBlocLocalizations.of(context).modellingsName}',
                    style: TextStyle(
                        color: Colors.white,
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
              child: BlocBuilder<ModellingsBloc, ModellingsState>(
                  builder: (context, state) {
                if (state is ModellingsLoading) {
                  return LoadingIndicator(key: ArchSampleKeys.todosLoading);
                } else if (state is ModellingsLoaded) {
                  final modellings = state.modellingsFetched;
                  return FilteredModellings(
                      modellings: modellings,
                      gardenName: 'jardin des espérides',
                      gardenPublicVisibility: false);
                } else {
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
                    '${FlutterBlocLocalizations.of(context).browseAllModellings}',
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
              child: BlocBuilder<ModellingsBloc, ModellingsState>(
                  builder: (context, state) {
                if (state is ModellingsLoading) {
                  return LoadingIndicator(key: ArchSampleKeys.todosLoading);
                } else if (state is ModellingsLoaded) {
                  final modellings = state.modellingsFetched;
                  return FilteredModellings(
                      modellings: modellings,
                      gardenName: 'jardin des espérides',
                      gardenPublicVisibility: false);
                } else {
                  return Container(
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

class ModellingsScreenArguments {
  final String gardenName;
  final bool gardenPublicVisibility;

  ModellingsScreenArguments(this.gardenName, this.gardenPublicVisibility);
}
