///Ekeh Wisdom ekeh.wisdom@gmail.com
///c2019
///Sun Nov 24 2019
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_sample/auth/auth_bloc.dart';
import 'package:bloc_sample/login/login_repository.dart';
import 'package:flutter/foundation.dart';

import 'index.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>  {
  LoginState get initialState {
    _repository = LoginRepository(this);
    return DefaultLoginState();
  }

  LoginRepository _repository;

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginFailedEvent)
      yield ErrorLoginState(event.message);
    else if (event is LoginSuccesEvent)
      Auth.add(LoggedIn(event.user));
    else if (event is LoginPressed) {
      yield LoadingLoginState();
      _repository.login(event.email, event.password);
    }
  }
}
