part of 'calendar_bloc.dart';

class CalendarState extends Equatable {
  final DateTime selectedDay;
  final Map<DateTime, int> drinkLog; // Stores drinks per date

  CalendarState({required this.selectedDay, required this.drinkLog});

  @override
  List<Object> get props => [selectedDay, drinkLog];
}
