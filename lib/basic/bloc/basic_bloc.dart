import 'dart:async';

import 'package:bloc/bloc.dart';
part 'basic_event.dart';
part 'basic_state.dart';

class BasicBloc extends Bloc<BasicEvent, BasicState> {
  @override
  BasicState get initialState => BasicState(0);

  @override
  Stream<BasicState> mapEventToState(BasicEvent event) async* {
    print(event ==  BasicEvent.increment);
    switch (event) {
      case BasicEvent.increment:
        yield BasicState((state.count ?? 0) + 1);
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
}