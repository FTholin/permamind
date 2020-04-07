import 'package:authentication/authentication.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const []]) : super(props);
}

class AppStarted extends AuthenticationEvent {
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthenticationEvent {
  @override
  String toString() => 'LoggedIn';
}

class LoggedOut extends AuthenticationEvent {
  @override
  String toString() => 'LoggedOut';
}


class DeletedAccount extends AuthenticationEvent {

  final String userId;

  DeletedAccount(this.userId);

  @override
  String toString() => 'DeletedAccount';
}


class UserUpdated extends AuthenticationEvent {
  final User user;

  UserUpdated(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'UserUpdated { user: $user }';
}