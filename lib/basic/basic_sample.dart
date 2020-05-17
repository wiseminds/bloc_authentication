import 'package:bloc_sample/auth/auth_bloc.dart';
import 'package:bloc_sample/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/basic_bloc.dart';

class BasicSample extends StatefulWidget {
  static const routeName = 'Basic';
  @override
  _BasicSampleState createState() => _BasicSampleState();
}

class _BasicSampleState extends State<BasicSample> {
  final BasicBloc bloc = BasicBloc();

  @override
  void dispose() {
    bloc?.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        bloc: Auth,
        listener: (context, state) {
          if (state is UnAuthenticated) {
            Navigator.of(context)
                .popUntil((r) => !Navigator.of(context).canPop());
            Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
          }
        },
        child: BlocBuilder<BasicBloc, BasicState>(
          bloc: bloc,
          builder: (context, state) => Stack(
            children: [
              Scaffold(
                appBar: AppBar(
                  title: Text('Basic Example'),
                  actions: [
                    IconButton(
                        icon: Icon(Icons.power),
                        onPressed: () => Auth.add(LogOut()))
                  ],
                ),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'You have pushed the button this many times:',
                      ),
                      Text(
                        '${state.count}',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () => bloc.add(BasicEvent.increment),
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ), // This trailing comma makes auto-formatting nicer for build methods.
              ),
              Positioned(
                bottom: 20,
                left: 10,
                child: FloatingActionButton(
                  onPressed: () => bloc.add(BasicEvent.decrement),
                  tooltip: 'Decrement',
                  heroTag: 'Decrement',
                  child: Icon(Icons.maximize),
                ),
              ),
              Positioned(
                bottom: 100,
                left: 10,
                child: FloatingActionButton(
                  onPressed: () => bloc.add(BasicEvent.reset),
                  tooltip: 'Reset',
                  heroTag: 'Reset',
                  child: Icon(Icons.restore),
                ),
              ),
            ],
          ),
        ));
  }
}
