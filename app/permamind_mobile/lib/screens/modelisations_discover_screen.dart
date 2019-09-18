import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:permamind_mobile/widgets/widgets.dart';
import 'package:todos_repository/todos_repository.dart';

//typedef OnSaveCallback = Function(String task, String note);

class ModelisationsDiscoverScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final todosBloc = BlocProvider.of<TodosBloc>(context);
    final localizations = ArchSampleLocalizations.of(context);

    return  Scaffold(
        appBar: AppBar(
    ),
    body: Column(
      children: <Widget>[
        Expanded(
            flex: 3,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.red,
                        child: Text(
                            '${FlutterBlocLocalizations.of(context).modelisationsName}',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 32)
                        )
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
//                            color: Colors.green,
                            child: Container(
                                margin: const EdgeInsets.only(top: 7, bottom: 7),
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
                            )
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                            color: Colors.yellow,
                          ),
                        )
                      ],
                    ),
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
              flex: 2,
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
              flex: 10,
              child: Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                color: Colors.blue,
                child: FilteredModelisations(),
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
                  flex: 2,
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
                  flex: 10,
                  child: Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
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