import 'package:authentication/authentication.dart';
import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:permamind/models/models.dart';
import 'package:permamind/screens/screens.dart';
import 'package:permamind/widgets/widgets.dart';


class DetailsGardenScreen extends StatelessWidget {

  final DataRepository dataRepository;

  final String gardenId;
  final User user;

  DetailsGardenScreen({
    Key key,
    @required this.dataRepository,
    @required this.gardenId,
    @required this.user,
  })
      : assert(dataRepository != null),
        assert(user != null),
        super(key: key ?? ArchSampleKeys.detailsGardenScreen);
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GardensBloc, GardensState>(
    builder: (context, state) {
      if (state is GardensLoaded) {

        final garden = state.gardens.firstWhere((garden) => garden.id == gardenId,
            orElse: () => null);

        return BlocProvider.value(
            value: BlocProvider.of<ParcelsBloc>(context),
            child: Scaffold(
              appBar: GardenAppBar(gardenId: gardenId, user: user),
              body: EnumeratedParcels(dataRepository: dataRepository, user: user),
              floatingActionButton: ParcelSpeedDial(
                garden: garden,
                userId: user.id,
                visible: true,
              ),
            )
        );
      } else {
        return Container();
      }
    });

  }
}


class GardenAppBar extends StatefulWidget implements PreferredSizeWidget {

  final String gardenId;
  final User user;

  GardenAppBar({
    @required this.gardenId,
    @required this.user,
    Key key})
      : preferredSize = Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0

  @override
  _GardenAppBarState createState() => _GardenAppBarState();
}

class _GardenAppBarState extends State<GardenAppBar> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GardensBloc, GardensState>(
        builder: (context, state) {
          final currentGarden = (state as GardensLoaded)
              .gardens.firstWhere((garden) => garden.id == widget.gardenId,
              orElse: () => null);

          return AppBar(
            title: currentGarden != null ? Text("${currentGarden.name}") : Text(
                ""),
            leading: IconButton(
              icon: new Icon(Icons.keyboard_arrow_left),
              onPressed: () =>
                  Navigator.pop(context)
            ),
            actions: <Widget>[

              BlocBuilder<ParcelsBloc, ParcelsState>(
                  builder: (context, state) {
                    if (state is ParcelsLoaded) {
                      return IconButton(

                        icon: Icon(Icons.settings),
                        onPressed: () async {
                          List<MemberProfile> initialMember = List<
                              MemberProfile>();

                          for (final member in currentGarden.members) {
                            if (member.id != widget.user.id) {
                              initialMember.add(MemberProfile(
                                  member.id,
                                  member.pseudo
                              ));
                            }
                          }


                          final alteredGarden = await Navigator.of(context)
                              .push(
                              MaterialPageRoute(
                                  builder: (_) {
                                    return BlocProvider.value(
                                      value: BlocProvider.of<ParcelsBloc>(
                                          context),
                                      child: SettingsGardenScreen(
                                          gardenId: currentGarden.id,
                                          initialMembersData: currentGarden
                                              .members,
                                          initialMember: initialMember,
                                          user: widget.user
                                      ),
                                    );
                                  })
                          );

                          if (alteredGarden == false) {
                            Navigator.pop(context);
                          }
                        },
                      );
                    } else {
                      return Container();
                    }
                  })

            ],
          );
        }
    );
  }
}





