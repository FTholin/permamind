import 'package:flutter/material.dart';




class OthersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Center(
        child: new Column(
          // center the children
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Icon(
              Icons.favorite,
              size: 160.0,
              color: Colors.grey[100],
            ),
            new Text("others")
          ],
        ),
      ),
    );
  }
}