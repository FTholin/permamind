//import 'package:arch/arch.dart';
//import 'package:data_repository/data_repository.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:permamind/blocs/blocs.dart';
//import 'package:permamind/widgets/widgets.dart';
//
//class DiscoverModelingsScreen extends StatelessWidget {
//  final Parcel parcel;
//  final String gardenId;
//
//  DiscoverModelingsScreen({
//    Key key,
//    @required this.parcel,
//    @required this.gardenId,
//  })  : assert(parcel != null),
//        assert(gardenId != null),
//        super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text("${parcel.name}")),
//      body: Column(
//        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//        children: <Widget>[
//          Flexible(
//            flex: 3,
//            child: Container(
//                margin: const EdgeInsets.only(left: 20, right: 20),
//                width: MediaQuery.of(context).size.width,
//                child: Text(
//                    '${AppLocalizations.of(context).discoverModelingsTitle}',
//                    style:
//                        TextStyle(fontWeight: FontWeight.normal, fontSize: 20))),
//          ),
//          Flexible(
//            flex: 2,
//            child: Column(
//              children: <Widget>[
//                Expanded(
//                    flex: 1,
//                    child: Container(
//                      margin: const EdgeInsets.only(left: 20, right: 20),
//                      width: MediaQuery.of(context).size.width,
//                      decoration: BoxDecoration(
//                        color: Colors.grey[300],
//                        borderRadius: BorderRadius.all(Radius.circular(18)),
//                      ),
//                      child: Row(
//                        children: <Widget>[
//                          Container(
//                            child: Icon(
//                              Icons.search,
//                              color: Colors.black,
//                            ),
//                            padding: EdgeInsets.only(left: 10),
//                          ),
//                        ],
//                      ),
//                    )),
//              ],
//            ),
//          ),
//          Flexible(
//            flex: 2,
//            child: Container(
//                margin: const EdgeInsets.only(left: 20, right: 20),
//                width: MediaQuery.of(context).size.width,
//                child: Text(
//                    '${AppLocalizations.of(context).discoverModelingsTendencyTitle}',
//                    style: TextStyle(
//                        fontWeight: FontWeight.normal, fontSize: 20))),
//          ),
//          Flexible(
//            flex: 9,
//            child: Container(
//              margin: const EdgeInsets.only(left: 20, right: 20),
//              child: BlocBuilder<ModelingsBloc, ModelingsState>(
//                  builder: (context, state) {
//                if (state is ModelingsLoading) {
//                  return LoadingIndicator();
//                } else if (state is ModelingsLoaded) {
//                  final modelings = state.modelingsFetched;
//                  return FilteredModelings(
//                    gardenId: gardenId,
//                    parcel: parcel,
//                    modelings: modelings,
//                  );
//                } else {
//                  return Container();
//                }
//              }),
//            ),
//          ),
//          Flexible(
//            flex: 2,
//            child: Container(
//                margin: const EdgeInsets.only(left: 20, right: 20),
//                width: MediaQuery.of(context).size.width,
//                child: Text(
//                    '${AppLocalizations.of(context).discoverModelingsBrowseTitle}',
//                    style: TextStyle(
//                        fontWeight: FontWeight.normal, fontSize: 20))),
//          ),
//          Flexible(
//            flex: 9,
//            child: Container(
//              margin: const EdgeInsets.only(left: 20, right: 20),
//              child: BlocBuilder<ModelingsBloc, ModelingsState>(
//                  builder: (context, state) {
//                if (state is ModelingsLoading) {
//                  return LoadingIndicator();
//                } else if (state is ModelingsLoaded) {
//                  final modelings = state.modelingsFetched;
//                  return FilteredModelings(
//                    gardenId: gardenId,
//                    parcel: parcel,
//                    modelings: modelings,
//                  );
//                } else {
//                  return Container();
//                }
//              }),
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//
////class ModelingsScreenArguments {
////  final String gardenName;
////  final bool gardenVisibility;
////  final List<GardenMember> gardenMembers;
////  final double gardenLength;
////  final double gardenWidth;
////  final bool gardenGround;
////
////  ModelingsScreenArguments(this.gardenName, this.gardenVisibility, this.gardenMembers, this.gardenLength, this.gardenWidth, this.gardenGround);
////}
