import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utility_app/src/screens/counter/counter_cubit.dart';
import 'package:utility_app/src/screens/counter/counter_view.dart';

class CounterPage extends StatelessWidget {
  final String title;

  const CounterPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: CounterView(title: title),
    );
  }
}
