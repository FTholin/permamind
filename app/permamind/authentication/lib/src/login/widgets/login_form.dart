import 'package:arch/arch.dart';
import 'package:authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  final UserRepository _userRepository;

  LoginForm({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginBloc _loginBloc;

  UserRepository get _userRepository => widget._userRepository;

  bool get isPopulated =>
      _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty;

  bool isLoginButtonEnabled(LoginState state) {
    return state.isFormValid && isPopulated && !state.isSubmitting;
  }

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _emailController.addListener(_onEmailChanged);
    _passwordController.addListener(_onPasswordChanged);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        '${AppLocalizations.of(context).loginFormFailureMessage}'),
                    Icon(Icons.error)
                  ],
                ),
                backgroundColor: Colors.red,
              ),
            );
        }
        if (state.isSubmitting) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${AppLocalizations.of(context).loginFormLoading}'),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
        }
        if (state.isSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(LoggedIn());
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(2 * SizeConfig.heightMultiplier),
//            child: Form(
//              child: ListView(
//                children: <Widget>[
//                  Padding(
//                    padding: EdgeInsets.symmetric(vertical: 2 * SizeConfig.heightMultiplier),
//                    child: Image.asset('assets/logo-dark.png', height: 200),
//                  ),
//                  GoogleLoginButton(),
//                  Padding(
//                    padding: EdgeInsets.symmetric(vertical: 2 * SizeConfig.heightMultiplier),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.center,
//                      children: <Widget>[
//                        Text("${AppLocalizations.of(context).logInOrSeparator}",
//                            textAlign: TextAlign.center,
//                            style: TextStyle(
//                                color: const Color(
//                                    0xFF01534F),
//                                fontSize: 1.8 *
//                                    SizeConfig
//                                        .textMultiplier,
////                                fontWeight:
////                                FontWeight.bold
////                          fontWeight: FontWeight.bold,
////                            ))
//                      ],
//                    ),
//                  ),
//                  TextFormField(
//                    controller: _emailController,
//                    decoration: InputDecoration(
//                      icon: Icon(Icons.email),
//                      labelText: '${AppLocalizations.of(context).email}',
//                    ),
//                    autovalidate: true,
//                    autocorrect: false,
//                    validator: (_) {
//                      return !state.isEmailValid
//                          ? '${AppLocalizations.of(context).invalidEmail}'
//                          : null;
//                    },
//                  ),
//                  TextFormField(
//                    controller: _passwordController,
//                    decoration: InputDecoration(
//                      icon: Icon(Icons.lock),
//                      labelText: '${AppLocalizations.of(context).password}',
//                    ),
//                    obscureText: true,
//                    autovalidate: true,
//                    autocorrect: false,
//                    validator: (_) {
//                      return !state.isPasswordValid
//                          ? '${AppLocalizations.of(context).invalidPassword}'
//                          : null;
//                    },
//                  ),
//                  Padding(
//                    padding: EdgeInsets.symmetric(vertical: 2 * SizeConfig.heightMultiplier),
//                    child: Column(
//                      crossAxisAlignment: CrossAxisAlignment.stretch,
//                      children: <Widget>[
//                        LoginButton(
//                          onPressed: isLoginButtonEnabled(state)
//                              ? _onFormSubmitted
//                              : null,
//                        ),
//                        ForgotPasswordButton(userRepository: _userRepository),
//                      ],
//                    ),
//                  ),
//                  Padding(
//                    padding: EdgeInsets.symmetric(vertical: 12 * SizeConfig.heightMultiplier),
//                    child: CreateAccountButton(userRepository: _userRepository),
//                  ),
//                ],
//              ),
//            ),
             child:  Column(

               children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Image.asset('assets/logo-dark.png')
                ),
                 Flexible(
                   flex: 1,
                   child: GoogleLoginButton(),
                 ),
                 Flexible(
                   child: Padding(
                     padding: EdgeInsets.all(3 * SizeConfig.heightMultiplier),
                     child: Text("${AppLocalizations.of(context).logInOrSeparator}",
                         textAlign: TextAlign.center,
                         style: TextStyle(
                           color: const Color(
                               0xFF01534F),
                           fontSize: 1.8 *
                               SizeConfig
                                   .textMultiplier,
//                                fontWeight:
//                                FontWeight.bold
//                          fontWeight: FontWeight.bold,
                         )),
                   )
                 ),
                 Flexible(
                   child: TextFormField(
                     controller: _emailController,
                     decoration: InputDecoration(
                       icon: Icon(Icons.email),
                       labelText: '${AppLocalizations.of(context).email}',
                     ),
//                     autovalidate: true,
//                     autocorrect: false,
                     validator: (_) {
                       return !state.isEmailValid
                           ? '${AppLocalizations.of(context).invalidEmail}'
                           : null;
                     },
                   ),
                 ),
                 Expanded(
                   child: TextFormField(
                     controller: _passwordController,
                     decoration: InputDecoration(
                       icon: Icon(Icons.lock),
                       labelText: '${AppLocalizations.of(context).password}',
                     ),
                     obscureText: true,
//                     autovalidate: true,
//                     autocorrect: false,
                     validator: (_) {
                       return !state.isPasswordValid
                           ? '${AppLocalizations.of(context).invalidPassword}'
                           : null;
                     },
                   ),
                 ),
                 Flexible(
                   child:   LoginButton(
                     onPressed: isLoginButtonEnabled(state)
                         ? _onFormSubmitted
                         : null,
                   ),
                 ),
                 Expanded(
                   child: ForgotPasswordButton(userRepository: _userRepository),

                 ),
Expanded(child: Container(),),
                 Expanded(
                   child: CreateAccountButton(userRepository: _userRepository) ,
                 )
               ],
             ),

          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    _loginBloc.add(
      LoginEmailChanged(email: _emailController.text),
    );
  }

  void _onPasswordChanged() {
    _loginBloc.add(
      LoginPasswordChanged(password: _passwordController.text),
    );
  }

  void _onFormSubmitted() {
    _loginBloc.add(
      LoginWithCredentialsPressed(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}
