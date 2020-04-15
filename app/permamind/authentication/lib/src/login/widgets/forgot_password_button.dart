import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:authentication/src/validators.dart';
import 'package:flutter/material.dart';


class ForgotPasswordButton extends StatefulWidget {
  final UserRepository _userRepository;

  ForgotPasswordButton({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  _ForgotPasswordButtonState createState() => _ForgotPasswordButtonState();
}

class _ForgotPasswordButtonState extends State<ForgotPasswordButton> {


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
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ForgotPasswordDialog(userRepository: widget._userRepository,);
          },
        );
      },
    );
  }
}

class ForgotPasswordDialog extends StatefulWidget {


  final UserRepository _userRepository;

  ForgotPasswordDialog({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  final TextEditingController _emailController = TextEditingController();

  bool isEmailValid = false;


  @override
  _ForgotPasswordDialogState createState() => new _ForgotPasswordDialogState();
}

class _ForgotPasswordDialogState extends State<ForgotPasswordDialog> {

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: new Text("${AppLocalizations.of(context).forgotPasswordDialogTitle}"),
      content: Column(
        mainAxisSize: MainAxisSize.min, // To make the card compact
        children: <Widget>[
          Text("${AppLocalizations.of(context).forgotPasswordDialogContent}"),
          TextField(
            controller: widget._emailController,
            decoration: InputDecoration(
              icon: Icon(Icons.mail),
              labelText: '${AppLocalizations.of(context).email}',
              errorText: widget.isEmailValid
                  ? "${AppLocalizations.of(context).invalidEmail}"
                  : null,
            ),
            onChanged: (value) {
              widget._emailController.text.isEmpty
                  ? widget.isEmailValid = true
                  : widget.isEmailValid =
              false;
              setState(() {});
            },
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
          child: new Text("${AppLocalizations.of(context).close}"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          color: Colors.green,
          child: new Text("${AppLocalizations.of(context).resetPassword}"),
          onPressed: () async {
            if (widget._emailController.text.isNotEmpty && Validators.isValidEmail(widget._emailController.text)) {
              try {
                await widget._userRepository.sendPasswordResetEmail(widget._emailController.text);
              } catch (e) {
              }
              Navigator.of(context).pop();
            } else {
              setState(() {
                widget._emailController.text.isEmpty || Validators.isValidEmail(widget._emailController.text)
                    ? widget.isEmailValid = true
                    : widget.isEmailValid = false;
              });
            }
          },
        ),
      ],
    );
  }
}
