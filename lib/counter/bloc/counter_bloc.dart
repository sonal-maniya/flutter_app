import 'package:flutter_bloc/flutter_bloc.dart';

class CounterEvents {}

class CounterIncrement extends CounterEvents {}

class CounterDecrement extends CounterEvents {}

class CounterBloc extends Bloc<CounterEvents, int> {
  CounterBloc() : super(0) {
    on<CounterIncrement>((event, emit) => emit(state + 1));
    on<CounterDecrement>((event, emit) => emit(state - 1));
  }
}
