import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:permamind_mobile/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permamind_mobile/arch_bricks/arch_bricks.dart';
import 'package:permamind_mobile/models/models.dart';

class ExtraActions extends StatelessWidget {
  // TODO key
  ExtraActions({Key key}) : super(key: ArchSampleKeys.extraActionsButton);

  @override
  Widget build(BuildContext context) {
    final gardensBloc = BlocProvider.of<GardensBloc>(context);
    final authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    return BlocBuilder<GardensBloc, GardensState>(
      builder: (context, state) {
        if (state is GardensLoaded) {

          return PopupMenuButton<ExtraAction>(
            icon: Icon(
              Icons.dehaze,
              size: 24.0,
              semanticLabel: 'Settings menu',
            ),
            key: FlutterTodosKeys.extraActionsPopupMenuButton,
            onSelected: (action) {
              switch (action) {
                case ExtraAction.LogOut:
                  authenticationBloc.dispatch(LoggedOut());
                  break;
                case ExtraAction.Settings:
                  // TODO
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuItem<ExtraAction>>[
              PopupMenuItem<ExtraAction>(
                key: ArchSampleKeys.settingsButton,
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