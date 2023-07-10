import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required AuthenticationRepository repository,
  })  : _repository = repository,
        super(const AuthenticationState.unauthenticated()) {
    on<_AuthenticationUserChangedState>(_onAuthenticationUserChangedStae);
    on<LogoutRequestedEvent>(_onLogoutRequestedEvent);

    _userSubscription = repository.user.listen((user) {
      add(_AuthenticationUserChangedState(user: user));
    });
  }

  final AuthenticationRepository _repository;
  late StreamSubscription<UserModel> _userSubscription;

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  Future<void> _onLogoutRequestedEvent(
    LogoutRequestedEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    unawaited(_repository.logout());
  }

  Future<void> _onAuthenticationUserChangedStae(
    _AuthenticationUserChangedState event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(
      event.user == UserModel.empty
          ? const AuthenticationState.unauthenticated()
          : AuthenticationState.authenticated(user: event.user),
    );
  }
}
