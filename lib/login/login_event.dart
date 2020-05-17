import 'package:bloc_sample/models/user.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginEvent {}

class LoginSuccesEvent extends LoginEvent {
  final User user;

  LoginSuccesEvent(this.user);
  @override
  String toString() => 'LoginSuccesEvent';
}

class LoginFailedEvent extends LoginEvent {
  final String message;

  LoginFailedEvent(this.message);
  @override
  String toString() => 'LoginFailedEvent';
}

class LoadLoginEvent extends LoginEvent {
  @override
  String toString() => 'LoadLoginEvent';
}

class LoginPressed extends LoginEvent {
  final String email;
  final String password;

  LoginPressed(this.email, this.password);

  @override
  String toString() => 'LoginPressed';
}
