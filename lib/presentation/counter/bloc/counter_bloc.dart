import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvents, int> {
  CounterBloc() : super(0) {
    on<CounterIncrement>((event, emit) => emit(state + 1));
    on<CounterDecrement>((event, emit) => emit(state - 1));
  }
}
