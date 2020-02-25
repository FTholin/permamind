import 'dart:async';
import 'package:authentication/authentication.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository _userRepository;

  AuthenticationBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    } else if (event is DeletedAccount) {
      yield* _mapDeletedAccountToState(event);
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if (isSignedIn) {
        yield Authenticated(await _userRepository.getUserFromId());
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield Authenticated(await _userRepository.getUserFromId());
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _userRepository.signOut();
  }

  Stream<AuthenticationState> _mapDeletedAccountToState(DeletedAccount event) async* {
    yield Unauthenticated();
    _userRepository.deleteAccount(event.userId);
  }
}
