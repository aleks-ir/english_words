import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState.initState());

  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    yield* event.map(
      stub: _stub,
    );
  }

  Stream<HomeState> _stub(Stub event) async* {
  }

}

