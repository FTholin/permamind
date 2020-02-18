import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/widgets/widgets.dart';

//typedef OnSaveCallback = Function(String task, String note);

class DiscoverModelingsScreen extends StatelessWidget {
  final Parcel parcel;

  DiscoverModelingsScreen({
    Key key,
    @required this.parcel,
  })  : assert(parcel != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${parcel.name}")),
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 32))),
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
                        fontWeight: FontWeight.normal, fontSize: 20))),
          ),
          Flexible(
            flex: 9,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: BlocBuilder<ModelingsBloc, ModelingsState>(
                  builder: (context, state) {
                if (state is ModelingsLoading) {
                  // TODO ArchSampleKeys
                  return LoadingIndicator(key: ArchSampleKeys.todosLoading);
                } else if (state is ModelingsLoaded) {
                  final modelings = state.modelingsFetched;
                  return BlocProvider.value(
                      value: BlocProvider.of<ParcelsBloc>(context),
                      child: FilteredModelings(
                        parcel: parcel,
                        modelings: modelings,
                      ));
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
                        fontWeight: FontWeight.normal, fontSize: 20))),
          ),
          Flexible(
            flex: 9,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: BlocBuilder<ModelingsBloc, ModelingsState>(
                  builder: (context, state) {
                if (state is ModelingsLoading) {
                  return LoadingIndicator(key: ArchSampleKeys.todosLoading);
                } else if (state is ModelingsLoaded) {
                  final modelings = state.modelingsFetched;
                  return BlocProvider.value(
                      value: BlocProvider.of<ParcelsBloc>(context),
                      child: FilteredModelings(
                        parcel: parcel,
                        modelings: modelings,
                      ));
//
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

//class ModelingsScreenArguments {
//  final String gardenName;
//  final bool gardenVisibility;
//  final List<GardenMember> gardenMembers;
//  final double gardenLength;
//  final double gardenWidth;
//  final bool gardenGround;
//
//  ModelingsScreenArguments(this.gardenName, this.gardenVisibility, this.gardenMembers, this.gardenLength, this.gardenWidth, this.gardenGround);
//}
