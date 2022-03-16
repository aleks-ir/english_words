import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'calendar_bloc.freezed.dart';
part 'calendar_event.dart';
part 'calendar_state.dart';


class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {


  CalendarBloc()
      : super(CalendarState.initState());

  @override
  Stream<CalendarState> mapEventToState(CalendarEvent event) async* {
    yield* event.map(
      stub: _stub,
    );
  }

  Stream<CalendarState> _stub(Stub event) async* {
  }

}
