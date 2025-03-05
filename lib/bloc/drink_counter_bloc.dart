import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class DrinkCounterEvent {}

class IncrementDrink extends DrinkCounterEvent {}

class DecrementDrink extends DrinkCounterEvent {}

// Bloc (State Management)
class DrinkCounterBloc1 extends Bloc<DrinkCounterEvent, int> {
  DrinkCounterBloc1() : super(0) {
    on<IncrementDrink>((event, emit) => emit(state + 1));
    on<DecrementDrink>((event, emit) => emit(state > 0 ? state - 1 : 0)); // Prevent negative numbers
  }
}
