import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'drink_counter_event.dart';
part 'drink_counter_state.dart';

class DrinkCounterBloc extends Bloc<DrinkCounterEvent, DrinkCounterState> {
  DrinkCounterBloc() : super(DrinkCounterState(0)) {
    on<IncrementDrink>((event, emit) {
      emit(DrinkCounterState(state.count + 1));
    });

    on<DecrementDrink>((event, emit) {
      if (state.count > 0) {
        emit(DrinkCounterState(state.count - 1));
      }
    });
  }
}

