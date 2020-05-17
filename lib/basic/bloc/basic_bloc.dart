import 'dart:async';

import 'package:bloc/bloc.dart';
part 'basic_event.dart';
part 'basic_state.dart';

class BasicBloc extends Bloc<BasicEvent, BasicState> {
  @override
  BasicState get initialState => BasicState(0);

  @override
  Stream<BasicState> mapEventToState(BasicEvent event) async* {
    print( BasicState(0) ==  BasicState(0));
    switch (event) {
      case BasicEvent.increment:
        yield* mapIncrementTostate(event);
        break;
      case BasicEvent.decrement:
        yield BasicState((state.count ?? 0) - 1);
        break;
      case BasicEvent.reset:
        yield BasicState(0);
        break;
      default:
    }
  }

  Stream<BasicState> mapIncrementTostate(BasicEvent event) async* {
    yield BasicState((state.count ?? 0) + 1);
  }
}
