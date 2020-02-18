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
                  Navigator.pushNamedAndRemoveUntil(
                      context, ArchSampleRoutes.home, (_) => false),
            ),
            actions: <Widget>[

              BlocBuilder<ParcelsBloc, ParcelsState>(
                  builder: (context, state) {
                    if (state is ParcelsLoaded) {
                      return IconButton(
//            tooltip: localizations.deleteGarden,
                        // TODO ArchSampleKeys
//                key: ArchSampleKeys.deleteGardenButton,
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


                          if (alteredGarden != null && alteredGarden != false) {
                            Map returnData = Map();

//                        List<Activity> activities = List<Activity>();
//                        state.schedule.entries.forEach((e) {
//                          e.value.forEach((item){
//                            activities.add(item);
//                          });
//                        });


//                        returnData['activities'] = activities;


                            if (alteredGarden['action'] == "Delete") {
                              returnData['garden'] = currentGarden;

                              returnData['action'] = "Delete";

//                          BlocProvider.of<ActivitiesBloc>(context).add(DeleteActivities(currentGarden.id));

                              BlocProvider.of<GardensBloc>(context).add(
                                  DeleteGarden(currentGarden));

//                          BlocProvider.of<ActivitiesBloc>(context).close();

                              Navigator.pop(context, returnData);
                            } else {
                              if (currentGarden.members.length == 1 ||
                                  currentGarden.admin == widget.user.id) {
                                returnData['garden'] = currentGarden;
                                BlocProvider.of<GardensBloc>(context).add(
                                    DeleteGarden(currentGarden));
                                BlocProvider.of<ActivitiesBloc>(context).add(
                                    DeleteActivities(currentGarden.id));
                                returnData['action'] = "Delete";
                              } else {
                                returnData['action'] = "Leave";

                                List<GardenMember> members = new List<
                                    GardenMember>.from(currentGarden.members);

                                // TODO Corriger bug rajout utilisateur dans la base
                                Garden copy = currentGarden.copyWith(
                                    name: currentGarden.name,
                                    id: currentGarden.id,
                                    publicVisibility: currentGarden
                                        .publicVisibility,
                                    admin: currentGarden.admin,
                                    members: members);

                                BlocProvider.of<GardensBloc>(context).add(
                                    LeaveGarden(currentGarden, widget.user.id)
                                );

                                returnData['garden'] = copy;
                              }

                              BlocProvider.of<ActivitiesBloc>(context).close();

                              Navigator.pop(context, returnData);
                            }
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





