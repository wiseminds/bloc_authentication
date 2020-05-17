import 'package:bloc_sample/models/user.dart';

import 'login_bloc.dart';
import 'login_event.dart';

class LoginRepository {
  final LoginBloc bloc;

  LoginRepository(this.bloc);

  void login(String email, String password) {
    if (email == 'test@test.com' && password == 'Password')
      bloc.add(LoginSuccesEvent(User(
          email: email,
          name: 'Test User',
          token: 'auth_token',
          image:
              'https://keenthemes.com/preview/metronic/theme/assets/pages/media/profile/people19.png')));
    else
      bloc.add(LoginFailedEvent('invalid email or password'));
  }
}
