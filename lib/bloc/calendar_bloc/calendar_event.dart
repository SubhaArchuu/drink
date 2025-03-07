part of 'calendar_bloc.dart';

abstract class CalendarEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DaySelected extends CalendarEvent {
  final DateTime selectedDay;

  DaySelected(this.selectedDay);

  @override
  List<Object> get props => [selectedDay];
}

class LogDrink extends CalendarEvent {
  final DateTime date;
  final int count;

  LogDrink(this.date, this.count);

  @override
  List<Object> get props => [date, count];
}
