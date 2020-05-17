import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class FormEvent extends Equatable {
  FormEvent([List props = const []]);
  @override
  List<Object> get props => [props];
}

class EmailChanged extends FormEvent {
  final String email;

  EmailChanged(this.email) : super([email]);

  @override
  String toString() => 'EmailChanged { email: $email }';
}

class PasswordChanged extends FormEvent {
  final String password;

  PasswordChanged(this.password) : super([password]);

  @override
  String toString() => 'PasswordChanged { password: $password}';
}

class NameChanged extends FormEvent {
  final String name;

  NameChanged(this.name);

  @override
  String toString() => 'NameChanged { name: $name }';
}



class PhoneNumberChanged extends FormEvent {
  final String number;

  PhoneNumberChanged(this.number);

  @override
  String toString() => 'PhoneNumberChanged { name: $number}';
}


class FormReset extends FormEvent {
  @override
  String toString() => 'FormReset';
}

class ToggleVisibility extends FormEvent {
  @override
  String toString() => 'ToggleVisibility';
}
