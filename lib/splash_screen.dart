import 'package:bloc_sample/auth/auth_bloc.dart';
import 'package:bloc_sample/basic/basic_sample.dart';
import 'package:bloc_sample/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navigatetoPage();
    super.initState();
  }

  void navigatetoPage() async {
    await Future.delayed(Duration(milliseconds: 700));
    if (Auth.state is AuthUninitialized) return navigatetoPage();
    Navigator.of(context).pushReplacementNamed((Auth.state is Authenticated)
        ? BasicSample.routeName
        : LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FlutterLogo(
        size: 40,
      ),
    );
  }
}
