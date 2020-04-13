import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';


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
            flex: 3,
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              child: Container(
//                color: Colors.red,
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                        borderRadius: BorderRadius.circular(50.0),
                        child: Container(

                          height: 10 * SizeConfig.heightMultiplier,
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
//            color: Colors.green,
            child: ListView(
              padding: const EdgeInsets.all(20.0),
              itemExtent: 106.0,
              children: [
                ListTile(
                  leading: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset('assets/utils_image/hat.png', fit: BoxFit.contain,)
                  ),
                  title: Text('Vous êtes un pionnier !', style: TextStyle(fontSize: 2 * SizeConfig.textMultiplier)),
                ),
                ListTile(
                  leading: AspectRatio(
                    aspectRatio: 1,
                    child: Center(
//                      color: Colors.yellow,
                       child: Text("${user.gardenCounter}", style: TextStyle(fontSize: 4 * SizeConfig.textMultiplier),)
                    )
                  ),
                  title: Text('${AppLocalizations.of(context).profileGardenCounter}', style: TextStyle(fontSize: 2 * SizeConfig.textMultiplier)),
                ),
                ListTile(
                  leading: AspectRatio(
                      aspectRatio: 1,
                      child: FutureBuilder<int>(
                        future:  _dataRepository.userParcelCounting(user.id, user.pseudo),
                        // a previously-obtained Future<String> or null
                        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                          if (snapshot.hasData) {
                            return Center(child: Text("${snapshot.data}", style: TextStyle(fontSize: 4 * SizeConfig.textMultiplier)),);
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      )
                  ),
                  title: Text('${AppLocalizations.of(context).profileGardenParcels}',style: TextStyle(fontSize: 2 * SizeConfig.textMultiplier)),
                ),
                ListTile(
                  leading: AspectRatio(
                      aspectRatio: 1,
                      child: FutureBuilder<int>(
                        future: _dataRepository.userActivitiesCounting(user.id),
                        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
                          if (snapshot.hasData) {
                            return Center(child: Text("${snapshot.data}", style: TextStyle(fontSize: 4 * SizeConfig.textMultiplier)));
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      )
                  ),
                  title: Text('${AppLocalizations.of(context).profileActivitesCounter}', style: TextStyle(fontSize: 2 * SizeConfig.textMultiplier)),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            Navigator.pushNamed(
              context,
              '/contactUs',
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            height: 7 * SizeConfig.heightMultiplier,
            width: double.infinity,
            child: Padding(
                padding: EdgeInsets.all(15),
                // TODO Changer internationalisation
                child: Center(
                  // TODO Internationalisation
                  child: Text("Contact us !",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: const Color(0xFFF9F9F9),
                        fontSize: 2.5 * SizeConfig.textMultiplier,
//                                             fontWeight: FontWeight.bold
                      )),
                )
            ),
          ),
        ),
        // TODO Changer internationalisation
      ],
    );
  }
}
