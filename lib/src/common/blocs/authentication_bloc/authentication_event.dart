part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {
  const AuthenticationEvent();
}

class _AuthenticationUserChangedEvent extends AuthenticationEvent {
  const _AuthenticationUserChangedEvent({required this.user});
  final UserModel user;
}

class LogoutRequestedEvent extends AuthenticationEvent {
  const LogoutRequestedEvent();
}
