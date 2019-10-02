import 'package:data_repository/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/blocs/blocs.dart';

class DetailsGardenScreen extends StatelessWidget {
  final Garden garden;

  DetailsGardenScreen({Key key, @required this.garden})
      : super(key: key ?? ArchSampleKeys.detailsGardenScreen);

  @override
  Widget build(BuildContext context) {
    final gardensBloc = BlocProvider.of<GardensBloc>(context);
    return BlocBuilder<GardensBloc, GardensState>(
      builder: (BuildContext context, GardensState state) {

        final localizations = ArchSampleLocalizations.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("${garden.gardenName}"),
            actions: <Widget>[
              IconButton(
                tooltip: localizations.deleteGarden,
                // TODO ArchSampleKeys
//                key: ArchSampleKeys.deleteGardenButton,
                icon: Icon(Icons.delete),
                onPressed: () {
                  gardensBloc.dispatch(DeleteGarden(garden));
                  Navigator.pop(context, garden);
                },
              )
            ],
          ),
          body: Container(
            child: Center(
              child: Text("My garden ${garden.gardenName}"),
            ),
          )
        );
      },
    );
  }
}