import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:permamind/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind/arch_bricks/arch_bricks.dart';
import 'package:permamind/models/models.dart';

class ExtraActions extends StatelessWidget {
  // TODO key
  ExtraActions({Key key}) : super(key: ArchSampleKeys.extraActionsButton);

  @override
  Widget build(BuildContext context) {
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    return BlocBuilder<GardensBloc, GardensState>(
      builder: (context, state) {
        if (state is GardensLoaded) {

          return PopupMenuButton<ExtraAction>(
            icon: Icon(
              Icons.more_vert,
              size: 24.0,
              semanticLabel: 'Settings menu',
            ),
            key: FlutterTodosKeys.extraActionsPopupMenuButton,
            onSelected: (action) {
              switch (action) {
                case ExtraAction.LogOut:
                  authenticationBloc.add(LoggedOut());
                  break;
                case ExtraAction.Settings:
                  Navigator.pushNamed(
                    context,
                    ArchSampleRoutes.settings);
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuItem<ExtraAction>>[
              PopupMenuItem<ExtraAction>(
                key: ArchSampleKeys.settingsButton,
                value: ExtraAction.Settings,
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text(ArchSampleLocalizations.of(context).settings),
                ),

              ),
              PopupMenuItem<ExtraAction>(
                key: ArchSampleKeys.loggedOut,
                value: ExtraAction.LogOut,
                child: ListTile(
                  leading: Icon(Icons.exit_to_app),
                  title: Text(ArchSampleLocalizations.of(context).logOut),
                ),
              ),
            ],
          );
        }
        // TODO key
        return Container(key: FlutterTodosKeys.extraActionsEmptyContainer);
      }
    );
  }
}