import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:table_calendar/table_calendar.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  CalendarBloc() : super(CalendarState(selectedDay: DateTime.now(), drinkLog: {})) {
    on<DaySelected>((event, emit) {
      emit(CalendarState(selectedDay: event.selectedDay, drinkLog: state.drinkLog));
    });

    on<LogDrink>((event, emit) {
      DateTime today = DateTime.now();
      DateTime selectedDate = DateTime(event.date.year, event.date.month, event.date.day);
      DateTime currentDate = DateTime(today.year, today.month, today.day);

      if (selectedDate.isBefore(currentDate)) {
        // Don't allow past date logging
        return;
      }

      final newLog = Map<DateTime, int>.from(state.drinkLog);
      newLog[event.date] = (newLog[event.date] ?? 0) + event.count;
      emit(CalendarState(selectedDay: state.selectedDay, drinkLog: newLog));
    });
  }
}
