import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:todos_repository/todos_repository.dart';

//typedef OnSaveCallback = Function(String task, String note);


List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(2, 1),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(2, 2),
  const StaggeredTile.count(1, 2),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(3, 1),
  const StaggeredTile.count(1, 1),
  const StaggeredTile.count(4, 1),
];

List<Widget> _tiles = const <Widget>[
  const _Example01Tile(Colors.green, Icons.widgets),
  const _Example01Tile(Colors.lightBlue, Icons.wifi),
  const _Example01Tile(Colors.amber, Icons.panorama_wide_angle),
  const _Example01Tile(Colors.brown, Icons.map),
  const _Example01Tile(Colors.deepOrange, Icons.send),
  const _Example01Tile(Colors.indigo, Icons.airline_seat_flat),
  const _Example01Tile(Colors.red, Icons.bluetooth),
  const _Example01Tile(Colors.pink, Icons.battery_alert),
  const _Example01Tile(Colors.purple, Icons.desktop_windows),
  const _Example01Tile(Colors.blue, Icons.radio),
];

class ModelisationsDiscoverScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
    ),
    body: Column(
      children: <Widget>[
        Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                      child: Text(
                        '${FlutterBlocLocalizations.of(context).modelisationsName}',
                        style: TextStyle(
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold,
                            fontSize: 25)
                    )
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    child: Row(
                      // TODO custom search bar
                      mainAxisAlignment: MainAxisAlignment.start,
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
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      color: Colors.red,
                  ),
                ],
              ),
            )
        ),
        Expanded(
            flex: 6,
            child: new StaggeredGridView.count(
              crossAxisCount: 4,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(4.0),
            )
        )
      ],
    )
    );
  }
}


class _Example01Tile extends StatelessWidget {
  const _Example01Tile(this.backgroundColor, this.iconData);

  final Color backgroundColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new Center(
          child: new Padding(
            padding: const EdgeInsets.all(4.0),
            child: new Icon(
              iconData,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}