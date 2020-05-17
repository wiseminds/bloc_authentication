import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class LoginState extends Equatable {
  final String message;
  final String title;
  LoginState([this.message,this.title]);

  @override
    List<Object> get props => [message, title];

  
}

/// UnInitialized
class DefaultLoginState extends LoginState {
   final String message;

  DefaultLoginState({this.message});
  @override
  String toString() => 'DefaultLoginState';

  
}

/// Initialized
class SuccessLoginState extends LoginState {
  final String message;
  final String title;

  SuccessLoginState(this.message, {this.title}): super(message);
  @override
  String toString() => 'SuccessLoginState';

  
}


class LoadingLoginState extends LoginState {
  @override
  String toString() => 'LoadingLoginState';
}


class ErrorLoginState extends LoginState {
  final String errorMessage;
  final String title;

  ErrorLoginState(this.errorMessage, {this.title}) :super(errorMessage);
  
  @override
  String toString() => 'ErrorLoginState';

  
}