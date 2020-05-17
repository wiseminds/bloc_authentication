import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import 'form_event.dart';
import 'form_state.dart';

class FormBloc extends Bloc<FormEvent, MyFormState> {
  @override
  MyFormState get initialState => MyFormState();

  @override
  Future<void> onTransition(
      Transition<FormEvent, MyFormState> transition) async {
    if (kDebugMode)
      print(
          'current state: ${transition.currentState}, next state: ${transition.nextState}');
    super.onTransition(transition);
  }

  @override
  Stream<MyFormState> mapEventToState(FormEvent event) async* {
    if (event is EmailChanged)
      yield state.copyWith(emaill: event.email?.trim());
    else if (event is PasswordChanged)
      yield state.copyWith(passw: event.password?.trim());
    else if (event is PhoneNumberChanged)
      yield state.copyWith(phone: event?.number?.trim());
    else if (event is NameChanged) yield state.copyWith(name: event.name);
  }
}
