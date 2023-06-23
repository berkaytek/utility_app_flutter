import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utility_app/src/screens/timer/bloc/timer_bloc.dart';

class TimerActions extends StatelessWidget {
  const TimerActions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
        buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...switch (state) {
                  TimerInitial() => [
                      FloatingActionButton(
                        heroTag: "Start Timer",
                        onPressed: () => context
                            .read<TimerBloc>()
                            .add(TimerStarted(duration: state.duration)),
                        child: const Icon(Icons.play_arrow),
                      ),
                    ],
                  TimerInProgress() => [
                      FloatingActionButton(
                        heroTag: "Pause timer",
                        onPressed: () =>
                            context.read<TimerBloc>().add(const TimerPaused()),
                        child: const Icon(Icons.pause),
                      )
                    ],
                  TimerInPause() => [
                      FloatingActionButton(
                        heroTag: "Start timer",
                        onPressed: () =>
                            context.read<TimerBloc>().add(const TimerResumed()),
                        child: const Icon(Icons.replay_circle_filled),
                      )
                    ],
                  TimerRunComplete() => [
                      FloatingActionButton(
                        heroTag: "Start Reset",
                        onPressed: () =>
                            context.read<TimerBloc>().add(const TimerReset()),
                        child: const Icon(Icons.replay_circle_filled),
                      )
                    ],
                }
              ],
            ),
          );
        });
  }
}
