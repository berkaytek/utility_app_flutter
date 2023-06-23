import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utility_app/src/screens/timer/bloc/timer_bloc.dart';
import 'package:utility_app/src/screens/timer/timer_view.dart';
import 'package:utility_app/src/screens/timer/utils/ticker.dart';

class TimerPage extends StatelessWidget {
  final String title;

  const TimerPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: const CustomTicker()),
      lazy: true,
      child: TimerView(
        title: title,
      ),
    );
  }
}
