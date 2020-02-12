import 'package:flutter/material.dart';

class GardenItem extends StatelessWidget {
  final String name;
  final String modelingName;
  final String membersCount;
  final int index;
  final int dayActivitiesCount;

  GardenItem({
    @required this.name,
    @required this.modelingName,
    @required this.membersCount,
    @required this.index,
    this.dayActivitiesCount
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4.5,
      margin: EdgeInsets.all(15),
      child: Stack(
        children: <Widget>[
          Image.asset("assets/gardens/garden-$index.jpg",
              width: 400, fit: BoxFit.fill),
          Positioned(
            bottom: 20,
            left: 20,
            height: 100,
            width: 250,
            child: Container(
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(9),
                color: Color(0xFFF9F9F9).withOpacity(0.86),
              ),
              child: Padding(
                  padding: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '${modelingName}',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 12,
                            color: Color(0xFF4FB06E)
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          '$name',
                          style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Color(0xFF01534F)
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:8),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.perm_identity,
                            color: Color(0xFF4FB06E),
                          ),
                          Text('$membersCount'),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 250,
            height: 30,
            width: 30,
            child: Container(
                padding: EdgeInsets.all(2),
                decoration: new BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
              child: Center(
                child: Text(
                  '$dayActivitiesCount',
                  style: TextStyle(fontSize: 20,color: Colors.white),
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
