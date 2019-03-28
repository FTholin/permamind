import 'package:flutter/material.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';
import 'package:permamind_mobile/screens/home.dart';
import 'package:permamind_mobile/blocs/bloc_provider.dart';



class GardensPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          // center the children
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.terrain,
              size: 160.0,
              color: Colors.yellow[100],
            ),
            new Text("gardens"),
            RaisedButton(
              child: Text('Maître'),
              onPressed: () {
                //_openOnePage(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}