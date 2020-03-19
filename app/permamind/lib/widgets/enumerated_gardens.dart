import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/widgets/widgets.dart';
import 'package:permamind/screens/screens.dart';

class EnumeratedGardens extends StatelessWidget {
  final DataRepository _dataRepository;
  final User _user;

  EnumeratedGardens(
      {Key key, @required DataRepository dataRepository, @required User user})
      : assert(dataRepository != null),
        assert(user != null),
        _user = user,
        _dataRepository = dataRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GardensBloc, GardensState>(builder: (context, state) {
      if (state is GardensLoaded) {
        final gardens = state.gardens;
        final parcels = state.gardenParcels;

        // Si aucun jardin
        if (gardens.length == 0) {
          return Padding(
              padding: EdgeInsets.all(
                1 * SizeConfig.heightMultiplier,
              ),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Text(
                          "Aucun potager pour l'instant. N'hesites pas à en ajouter !"),
                    ),
                  ),
                  RaisedButton(
                    child: Text("Ajouter un potager"),
                    onPressed: () {},
                  )
                ],
              ));
        } else {
          return Column(
            children: <Widget>[
              Expanded(
                  child: ListView.builder(
                    itemCount: gardens.length,
                    itemBuilder: (context, i) {
                      return GardenItem(
                        name: gardens[i].name,
                        garden: gardens[i],
                        user: _user,
                        index: i,
                        dayActivitiesCount: 8,
                      );
                    },
                  )
              ),
            ],
          );
        }
      } else {
        return Container();
      }
    });
  }
}

