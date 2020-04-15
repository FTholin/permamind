import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GoogleLoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return SizedBox(
        width: double.infinity, // match_parent
        child: RaisedButton.icon(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          icon: Icon(FontAwesomeIcons.google, color: Colors.white),
          onPressed: () {
            BlocProvider.of<LoginBloc>(context).add(
              LoginWithGooglePressed(),
            );
          },
          label: Text('${AppLocalizations.of(context).signInGoogleTitle}', style: TextStyle(color: Colors.white)),
          color: Colors.redAccent,
        )
    );
  }
}
