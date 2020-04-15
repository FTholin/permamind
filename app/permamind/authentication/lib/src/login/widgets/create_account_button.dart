import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';


class CreateAccountButton extends StatelessWidget {
  final UserRepository _userRepository;

  CreateAccountButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {

    return FlatButton(
      child: RichText(
        text: TextSpan(
          text: '${AppLocalizations.of(context).logInNotMember}',
          style: DefaultTextStyle.of(context).style,
          children: <TextSpan>[
            TextSpan(text: '${AppLocalizations.of(context).logInJoin}', style: TextStyle(
                fontWeight: FontWeight.bold,
              fontSize: 1.8 *
                  SizeConfig
                      .textMultiplier,)),
          ],
        ),
      ),

      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return RegisterScreen(userRepository: _userRepository);
          }),
        );
      },
    );
  }
}
