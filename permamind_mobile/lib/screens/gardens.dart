import 'package:flutter/material.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'package:permamind_mobile/blocs/vegetable_bloc.dart';
import 'package:permamind_mobile/screens/garden_design.dart';


class GardensPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final GardensBloc bloc = BlocProvider.of<GardensBloc>(context);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Liste de jardins")
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _gardenDesigning(context);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


void _gardenDesigning(BuildContext context) {
  Navigator
      .of(context)
      .push(MaterialPageRoute(builder: (BuildContext context) {
    return  GardenDesigner();
  }));
}