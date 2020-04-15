import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';


class ForgotPasswordButton extends StatelessWidget {
  final UserRepository _userRepository;

  ForgotPasswordButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        '${AppLocalizations.of(context).forgotPassword}',
        style: TextStyle(
          decoration: TextDecoration.underline,
          fontSize: 1.5 *
              SizeConfig
                  .textMultiplier,
        ),),
      onPressed: () {
//        Navigator.of(context).push(
//          MaterialPageRoute(builder: (context) {
//            return RegisterScreen(userRepository: _userRepository);
//          }),
//        );
      },
    );
  }
}
