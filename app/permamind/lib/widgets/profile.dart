import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/widgets/widgets.dart';
import 'package:permamind/screens/screens.dart';

class Profile extends StatelessWidget {
  final DataRepository _dataRepository;
  final User user;

  Profile(
      {Key key, @required DataRepository dataRepository, @required User user})
      : assert(dataRepository != null),
        user = user,
        _dataRepository = dataRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Container(
//                color: Colors.red,
                child: Row(
                  children: <Widget>[

                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Container(
                        color: Colors.teal,
                        child: Image.asset('assets/utils_image/farmer.png', fit: BoxFit.scaleDown,),
                      )
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5.0, 15.0, 2.0, 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                "${user.pseudo}",
                                style: TextStyle(
                                  color: const Color(0xFF01534F),
                                  fontSize:
                                  2 * SizeConfig.textMultiplier,
                                  fontWeight: FontWeight.bold,
                                )),
                            const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                            RaisedButton(
                              child: Text("Edit profile"),
                            )
                          ],
                        ),
                      )
                    )
                  ],
                ),
              ),
            )),
        Expanded(
          flex: 1,
          child: Container(
            color: Color.fromRGBO(214, 211, 94, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("MY STATS",
                    style: TextStyle(
                      color: const Color(0xFF01534F),
                      fontSize: 1.8 * SizeConfig.textMultiplier,
//                        fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          ),
        ),
        Expanded(
          flex: 9,
          child: Container(
            color: Colors.green,
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              itemExtent: 106.0,
              children: [
                ListTile(
                  leading: AspectRatio(
                    aspectRatio: 1,
                    child: Text("1", style: TextStyle(fontSize: 50),)
                  ),
                  title: Text('jardin'),
                ),
                ListTile(
                  leading: AspectRatio(
                      aspectRatio: 1,
                      child: Text("3", style: TextStyle(fontSize: 50),)
                  ),
                  title: Text('Parcelles'),
                ),
                ListTile(
                  leading: AspectRatio(
                      aspectRatio: 1,
                      child: Text("10", style: TextStyle(fontSize: 50),)
                  ),
                  title: Text('Activités réalisées'),
                ),
                ListTile(
                  leading: AspectRatio(
                      aspectRatio: 1,
                      child: Text("1", style: TextStyle(fontSize: 50),)
                  ),
                  title: Text('One-line with leading widget'),
                ),
              ],
            ),
          ),
        )
        // TODO Changer internationalisation
      ],
    );
  }
}
