import 'package:flutter/material.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:todos_repository/todos_repository.dart';

//typedef OnSaveCallback = Function(String task, String note);




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
                            fontSize: 33)
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
//                      margin: const EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      color: Colors.red,
                  ),
                ],
              ),
            )
        ),
        Expanded(
            flex: 4,
          child: Column(
            children: <Widget>[
            Expanded(
            flex: 1,
            child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Text(
                    '${FlutterBlocLocalizations.of(context).tendencyHeader}',
                    style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.bold,
                        fontSize: 25)
                )
            ),
          ),
            Expanded(
              flex: 7,
              child: Container(
                color: Colors.blue,
              ),
            )
            ],
          )
        ),
        Expanded(
            flex: 4,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: Text(
                          '${FlutterBlocLocalizations.of(context).browseAllModelisations}',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.bold,
                              fontSize: 25)
                      )
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    color: Colors.blue,
                  ),
                )
              ],
            )
        ),
      ],
    )
    );
  }
}