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
    return BlocBuilder<BasicBloc, BasicState>(
      bloc: bloc,
      builder: (context, state) => Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text('Basic Example'),
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
              child: Icon(Icons.maximize),
            ),
          ),
          Positioned(
            bottom: 100,
            left:10 ,
            child: FloatingActionButton(
              onPressed: () => bloc.add(BasicEvent.reset),
              tooltip: 'Reset',
              child: Icon(Icons.restore),
            ),
          ),
        ],
      ),
    );
  }
}
