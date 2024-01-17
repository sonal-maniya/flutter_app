import 'package:flutter/material.dart';
import 'package:flutter_app/presentation/counter/bloc/counter_bloc.dart';
import 'package:flutter_app/presentation/counter/cubit/counter_cubit.dart';
import 'package:flutter_app/presentation/counter/view/counter_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => CounterBloc()),
      ],
      child: const CounterView(),
    );
  }
}
