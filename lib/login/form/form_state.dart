import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class MyFormState extends Equatable {
  final String email,
      password,
      rePassword,
      phone,
      gender,
      name;

  @override
  List<Object> get props => [
        email,
        password,
        rePassword,
        phone,
        name,
        gender,
      ];

  MyFormState(
      {this.gender,
      this.phone,
      this.name,
      this.email,
      this.password,
      this.rePassword});

  MyFormState copyWith(
      {String emaill,
      String name,
      String gender,
      String passw,
      String rPassw,
      String phone}) {
    return MyFormState(
        email: emaill ?? this.email,
        password: passw ?? this.password,
        rePassword: rPassw ?? this.rePassword,
        phone: phone ?? this.phone,     
        gender: gender ?? this.gender,        
        name: name ?? this.name);
  }

  @override
  String toString() {
    return '''MyFormState {
      email: $email,
      password: $password,
      rePassword: $rePassword,
      phone: $phone,
      gender: $gender, 
      name: $name
    }''';
  }
}
