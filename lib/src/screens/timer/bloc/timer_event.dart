part of 'timer_bloc.dart';

sealed class TimerEvent {
  const TimerEvent();
}

final class TimerStarted extends TimerEvent {
  const TimerStarted({required this.duration});

  final int duration;
}

final class TimerPaused extends TimerEvent {
  const TimerPaused();
}

final class TimerResumed extends TimerEvent {
  const TimerResumed();
}

final class TimerReset extends TimerEvent {
  final int duration;
  const TimerReset({required this.duration});
}

final class TimerSet extends TimerEvent {
  final int duration;
  const TimerSet({required this.duration});
}

class _TimerTicked extends TimerEvent {
  const _TimerTicked({required this.duration});

  final int duration;
}
