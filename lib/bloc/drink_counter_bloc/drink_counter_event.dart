part of 'drink_counter_bloc.dart';

abstract class DrinkCounterEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class IncrementDrink extends DrinkCounterEvent {}

class DecrementDrink extends DrinkCounterEvent {}
