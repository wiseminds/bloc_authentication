import 'dart:io';
import 'dart:ui';

import 'package:bloc_sample/auth/auth_bloc.dart';
import 'package:bloc_sample/basic/basic_sample.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'form/form_bloc.dart';
import 'form/form_event.dart';
import 'form/form_state.dart';
import 'login_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  final LoginBloc loginBloc;

  LoginScreen({Key key, this.loginBloc}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FormBloc _formBloc;
  TextEditingController _emailController;
  TextEditingController _passwordController;
  FocusNode _emailNode;
  FocusNode _passwordNode;
  LoginBloc _loginBloc;
  bool isExpired = false;
  GlobalKey<FormState> _formKey = GlobalKey(debugLabel: 'login');

  bool autoValidateMail = false;
  bool autoValidatePass = false;
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _formBloc = FormBloc();
    _loginBloc = widget.loginBloc ?? LoginBloc();
    _emailNode = FocusNode();
    _passwordNode = FocusNode();
    super.initState();
    _emailController.addListener(
        () => {_formBloc.add(EmailChanged(_emailController.text))});
    _passwordController.addListener(
        () => {_formBloc.add(PasswordChanged(_passwordController.text))});
  }

  @override
  void dispose() {
    _loginBloc?.close();
    _formBloc?.close();
    _emailController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        bloc: Auth,
        listener: (context, state) {
          if (state is Authenticated)
            Navigator.of(context).pushReplacementNamed(BasicSample.routeName);
        },
        child: BlocListener<LoginBloc, LoginState>(
            bloc: _loginBloc,
            listener: (context, state) {
              if (state?.message != null && state?.message != '')
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (c) => Dialog(child: Text(state.message)));
            },
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 70),
                  BlocBuilder<FormBloc, MyFormState>(
                    bloc: _formBloc,
                    builder: (context, state) {
                      return TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          focusNode: _emailNode,
                          decoration: InputDecoration(
                              hintText: 'Please Ennter your email',
                              labelText: 'Email',
                              icon: Icon(Icons.email)));
                    },
                  ),
                  BlocBuilder<FormBloc, MyFormState>(
                    bloc: _formBloc,
                    builder: (context, state) {
                      return TextFormField(
                        controller: _passwordController,
                        focusNode: _passwordNode,
                        decoration: InputDecoration(
                          hintText: 'Please Ennter your Password',
                          labelText: 'Password',
                          icon: Icon(Icons.lock),
                        ),
                      );
                    },
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                      bloc: _loginBloc,
                      builder: (context, currentState) => FlatButton(
                          onPressed: _loginPressed, child: Text('LOGIN'))),
                  SizedBox(height: 20),
                ],
              ),
            )

            // SizedBox(height: 40),

            ));
  }

  void _loginPressed() {
    if (_loginBloc.state is! LoadingLoginState &&
        _formKey.currentState.validate()) {
      _loginBloc
          .add(LoginPressed(_formBloc.state.email, _formBloc.state.password));
      autoValidateMail = true;
      autoValidatePass = true;
      setState(() {});
    }
  }
}
