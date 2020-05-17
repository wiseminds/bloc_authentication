import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_sample/models/user.dart';
import 'package:bloc_sample/utils/pref_keys.dart';
import 'package:bloc_sample/utils/secure_store.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

/// authentication bloc
final AuthBloc Auth = AuthBloc();

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  SecureStore _secureStore = SecureStore();
  static final AuthBloc _authBlocSingleton = AuthBloc._internal();

  factory AuthBloc() => _authBlocSingleton;

  AuthBloc._internal();

  @override
  AuthState get initialState {
    Future.delayed(Duration.zero, () => this.add(AppStarted()));
    return AuthUninitialized();
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStarted) {
      // get stored token and user data from secure storage
      String usr = await _secureStore.getString(PrefKeys.user);
      String token = await _secureStore.getString(PrefKeys.token);
      final user = usr == null ? null : User.fromJson(json.decode(usr));
      if (user != null && token != null)
        yield Authenticated(token, user);
      else
        yield UnAuthenticated();
    } else if (event is LoggedIn) {
      yield Authenticated(state.token, event.user);
      _secureStore.setString(PrefKeys.user, json.encode(event.user.toJson()));
    } else if (event is UpdateToken) {
      yield Authenticated(event.token, state.user);
      _secureStore.setString(PrefKeys.token, event.token);
    } else if (event is LogOut) {
      _secureStore.deleteKey(PrefKeys.user);
      _secureStore.deleteKey(PrefKeys.token);
      yield UnAuthenticated();
    } else if (event is UpdateUser)
      yield Authenticated(state.token, event.user);
  }

  @override
  Future<void> close() {
    _authBlocSingleton.close();
    return super.close();
  }
}
