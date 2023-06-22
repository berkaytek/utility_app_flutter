part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  const TimerState(this.duration);

  final int duration;

  @override
  List<Object?> get props => [duration];
}

final class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString() => " TimerInitial { Duration : $duration } ";
}

final class TimerInProgress extends TimerState {
  const TimerInProgress(super.duration);

  @override
  String toString() => " TimerInProgress { Duration : $duration } ";
}

final class TimerInPause extends TimerState {
  const TimerInPause(super.duration);

  @override
  String toString() => " TimerInPause { Duration : $duration } ";
}

final class TimerRunComplete extends TimerState {
  const TimerRunComplete() : super(0);
}
