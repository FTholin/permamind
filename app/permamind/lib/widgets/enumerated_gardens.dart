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
    return BlocBuilder<GardensBloc, GardensState>(
        builder: (context, state) {
      if (state is GardensLoaded) {
        final gardens = state.gardens;

        return Padding(
            padding: EdgeInsets.all(10.0),
            child: ListView.builder(
              key: ArchSampleKeys.todoList,
              itemCount: gardens.length,
              itemBuilder: (BuildContext context, int index) {
                return InkResponse(
                  enableFeedback: true,
                  child: GardenItem(
                      name: gardens[index].name,
                      membersCount: gardens[index].members.length.toString(),
                      index: index,
                      dayActivitiesCount: gardens[index].dayActivitiesCount),
                  onTap: () async {
                    Navigator.pushNamed(
                      context,
                      '/detailsGarden',
                      arguments: DetailsGardenScreenArguments(
                        _dataRepository,
                        gardens[index].id,
                        _user
                      ),
                    );
                  },
                );
              },
            ));
      } else {
        return Container();
      }
    });
  }
}
