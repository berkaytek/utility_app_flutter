import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utility_app/src/screens/timer/bloc/timer_bloc.dart';

class TimerActions extends StatefulWidget {
  const TimerActions({super.key});

  @override
  State<TimerActions> createState() => _TimerActionsState();
}

class _TimerActionsState extends State<TimerActions> {
  late TextEditingController timerValueController;

  @override
  void initState() {
    super.initState();
    timerValueController = TextEditingController();
    timerValueController.addListener(() {
      final String text = timerValueController.text;

      /// Control to check whether if timer value is valid integer
      /// and smaller than max value
      int timerDuration = int.tryParse(text) ?? 0;
      if (timerDuration > 3600) {
        timerDuration = 86400;
      }
      if (timerDuration < 0) {
        timerDuration = 0;
      }
      timerValueController.value =
          timerValueController.value.copyWith(text: timerDuration.toString());
    });
  }

  @override
  void dispose() {
    super.dispose();
    timerValueController.dispose();
  }

  int parseControllerValueAsIntOrDefault() {
    return int.tryParse(timerValueController.text) ?? 60;
  }

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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          heroTag: "Start Timer",
                          onPressed: () => context
                              .read<TimerBloc>()
                              .add(TimerStarted(duration: state.duration)),
                          child: const Icon(Icons.play_arrow),
                        ),
                      ),
                    ],
                  TimerInProgress() => [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          heroTag: "Pause timer",
                          onPressed: () =>
                              context.read<TimerBloc>().add(const TimerPaused()),
                          child: const Icon(Icons.pause),
                        ),
                      )
                    ],
                  TimerInPause() => [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          heroTag: "Start timer",
                          onPressed: () =>
                              context.read<TimerBloc>().add(const TimerResumed()),
                          child: const Icon(Icons.replay_circle_filled),
                        ),
                      )
                    ],
                  TimerRunComplete() => [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          heroTag: "Start Reset",
                          onPressed: () => context
                              .read<TimerBloc>()
                              .add(const TimerReset(duration: 90)),
                          child: const Icon(Icons.replay_circle_filled),
                        ),
                      )
                    ],
                },
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    heroTag: "Configure Timer",
                    onPressed: () => _buildShowDialog(context, state),
                    child: const Icon(Icons.settings),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    heroTag: "Configure Timer",
                    onPressed: () => context.read<TimerBloc>().add(TimerReset(
                        duration: parseControllerValueAsIntOrDefault())),
                    child: const Icon(Icons.delete),
                  ),
                )
              ],
            ),
          );
        });
  }

  _buildShowDialog(BuildContext context, TimerState state) {
    BuildContext commonContext = context;

    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text(
                  "Enter a time value (seconds), max value is 1 day  (86400 seconds)"),
              content: TextFormField(controller: timerValueController),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, "Cancel"),
                    child: const Text("Cancel")),
                TextButton(
                    onPressed: () => {
                          BlocProvider.of<TimerBloc>(commonContext).add(
                              TimerReset(
                                  duration:
                                      parseControllerValueAsIntOrDefault())),
                          Navigator.pop(context, "Ok"),
                        },
                    child: const Text("Ok"))
              ],
            ));
  }
}
