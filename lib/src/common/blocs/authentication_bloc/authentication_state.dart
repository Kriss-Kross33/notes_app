part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unauthenticated,
    this.user = UserModel.empty,
  });

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  const AuthenticationState.authenticated({required UserModel user})
      : this._(
          user: user,
          status: AuthenticationStatus.authenticated,
        );

  final AuthenticationStatus status;
  final UserModel user;

  @override
  List<Object> get props => [status, user];
}
