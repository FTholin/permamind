import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class RegisterEvent extends Equatable {
  RegisterEvent([List props = const []]) : super(props);
}

class RegisterEmailChanged extends RegisterEvent {
  final String email;

  RegisterEmailChanged({@required this.email}) : super([email]);

  @override
  String toString() => 'EmailChanged { email :$email }';
}


class RegisterPseudoChanged extends RegisterEvent {
  final String pseudo;

  RegisterPseudoChanged({@required this.pseudo}) : super([pseudo]);

  @override
  String toString() => 'PseudoChanged { pseudo :$pseudo }';
}

class RegisterPasswordChanged extends RegisterEvent {
  final String password;

  RegisterPasswordChanged({@required this.password}) : super([password]);

  @override
  String toString() => 'PasswordChanged { password: $password }';
}

class RegisterConfirmPasswordChanged extends RegisterEvent {
  final String confirmPassword;
  final String password;
  RegisterConfirmPasswordChanged({@required this.password, @required this.confirmPassword}) : super([confirmPassword]);

  @override
  String toString() => 'RegisterConfirmPasswordChanged { password: $confirmPassword }';
}

class RegisterSubmitted extends RegisterEvent {
  final String pseudo;
  final String email;
  final String password;

  RegisterSubmitted({@required this.pseudo, @required this.email, @required this.password})
      : super([pseudo, email, password]);

  @override
  String toString() {
    return 'Submitted { pseudo: $pseudo, email: $email, password: $password }';
  }
}
