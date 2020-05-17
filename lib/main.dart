import 'package:bloc_sample/basic/basic_sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth/auth_bloc.dart';
import 'login/login_screen.dart';

void main() {
  Auth..add(AppStarted());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        title: 'Basic Sample',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: <String, WidgetBuilder>{
          BasicSample.routeName: (BuildContext context) => BasicSample(),
          LoginScreen.routeName: (BuildContext context) => LoginScreen(),
          '/': (BuildContext context) => BasicSample(),
        },
      ),
    );
  }
}
