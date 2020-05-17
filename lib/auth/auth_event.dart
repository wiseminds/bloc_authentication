part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AppStarted extends AuthEvent {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'AppStarted';
}

class LoggedIn extends AuthEvent {
  final User user;

  LoggedIn(this.user);
  @override
  List<Object> get props => [user];
  @override
  String toString() => 'LoggedIn';
}

class LogOut extends AuthEvent {
  @override
  List<Object> get props => [];
  @override
  String toString() => 'LogOut';
}

class UpdateUser extends AuthEvent {
  final User user;

  UpdateUser(this.user);
  @override
  List<Object> get props => [user];
  @override
  String toString() => 'UpdateUser';
}


class UpdateToken extends AuthEvent {
  final String token;

  UpdateToken(this.token) : super();
  @override
  List<Object> get props => [];
  @override
  String toString() => 'UpdateToken';
}
