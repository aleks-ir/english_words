import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

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

