import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utility_app/src/screens/timer/bloc/timer_bloc.dart';
import 'package:utility_app/src/screens/timer/timer_actions.dart';
import 'package:utility_app/src/screens/timer/timer_background.dart';
import 'package:utility_app/src/widgets/animated_hourglass.dart';
import 'package:utility_app/src/widgets/app_bar.dart';
import 'package:utility_app/src/widgets/app_drawer.dart';

class TimerView extends StatelessWidget {
  final String title;

  const TimerView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: DefaultAppBar(title: title),
        drawer: const DefaultDrawer(),
        body: const Center(
          child: Stack(
            children: [
              TimerBackground(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedHourglassLogo(),
                  TimerText(),
                  TimerActions()
                ],
              )
            ],
          ),
        ));
  }
}

class TimerText extends StatelessWidget {
  const TimerText({super.key});

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final String minutes =
        ((duration / 60) % 60).floor().toString().padLeft(2, '0');
    final String seconds = (duration % 60).floor().toString().padLeft(2, '0');
    return Text("$minutes : $seconds",
        style: Theme.of(context).textTheme.displaySmall);
  }
}
