import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/screens/add_parcel_screen.dart';
//
//class ParcelSpeedDial extends StatefulWidget {
//  final bool visible;
//  final Garden garden;
//  final DataRepository dataRepository;
//  final User user;
//
//  ParcelSpeedDial({this.dataRepository, this.garden, this.user, this.visible});
//
//  @override
//  ParcelSpeedDialState createState() => ParcelSpeedDialState();
//}
//
//class ParcelSpeedDialState extends State<ParcelSpeedDial>
//    with TickerProviderStateMixin {
//  bool addButtonSelected = false;
//
//  SpeedDial buildSpeedDial() {
//    return SpeedDial(
//      visible: widget.visible,
//      child: new IconTheme(
//        data: new IconThemeData(color: Colors.white),
//        child: new Icon(addButtonSelected ? Icons.clear : Icons.add),
//      ),
//      animatedIconTheme: IconThemeData(size: 22.0),
//      onOpen: () {
//        setState(() {
//          addButtonSelected = true;
//        });
//      },
//      onClose: () {
//        setState(() {
//          addButtonSelected = false;
//        });
//      },
//      curve: Curves.bounceIn,
//      children: [
//        SpeedDialChild(
//          child: Icon(
//            Icons.aspect_ratio,
//            color: Colors.white,
//            size: 30.0,
//          ),
//          backgroundColor: Colors.green,
//          onTap: () async {
//            Navigator.of(context).push(MaterialPageRoute(builder: (_) {
//              return BlocProvider.value(
//                value: BlocProvider.of<ParcelsBloc>(context),
//                child: AddParcelScreen(dataRepository: widget.dataRepository, garden: widget.garden, user: widget.user),
//              );
//            }));
//          },
//          label: '${AppLocalizations.of(context).speedDialCreateParcel}',
//          labelStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 20, color: Colors.white),
//          labelBackgroundColor: Colors.green,
//        ),
//      ],
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return buildSpeedDial();
//  }
//}
