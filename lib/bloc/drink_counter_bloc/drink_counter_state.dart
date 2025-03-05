part of 'drink_counter_bloc.dart';

class DrinkCounterState extends Equatable {
  final int count;

  DrinkCounterState(this.count);

  @override
  List<Object> get props => [count];
}
