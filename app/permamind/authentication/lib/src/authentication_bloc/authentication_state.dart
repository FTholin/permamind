import 'package:authentication/authentication.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthenticationState extends Equatable {
  AuthenticationState([List props = const []]) : super(props);

  @override
  List<Object> get props => [];
}

class Uninitialized extends AuthenticationState {
  @override
  String toString() => 'Uninitialized';

}

class Authenticated extends AuthenticationState {
  final User userAuthenticated;

  Authenticated(this.userAuthenticated) : super([userAuthenticated]);

  @override
  List<Object> get props => [userAuthenticated];

  @override
  String toString() => 'Authenticated { displayName: $userAuthenticated }';
}

class Unauthenticated extends AuthenticationState {
  @override
  String toString() => 'Unauthenticated';
}
