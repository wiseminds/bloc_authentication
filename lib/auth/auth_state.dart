part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final User user;
  final String token;
  const AuthState( this.token, this.user);
}

/// the app is yet to verify authentication status
class AuthUninitialized extends AuthState {
  AuthUninitialized() : super(null, null);

  @override
  List<Object> get props => [];
  @override
  String toString() => 'AuthUninitialized';
}

/// user is signed in 
class Authenticated extends AuthState {
  Authenticated(String token, User user,) : super(token, user);
  @override
  List<Object> get props => [user];
  @override
  String toString() => 'Authenticated';
}

/// user has not signed in
class UnAuthenticated extends AuthState {
  UnAuthenticated() : super(null, null);

  @override
  List<Object> get props => [];
  @override
  String toString() => 'UnAuthenticated';
}

