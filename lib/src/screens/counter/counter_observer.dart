import "package:bloc/bloc.dart";
import "package:logger/logger.dart";

/// [BlocObserver] for the counter application which observes all state changes.
class CounterObserver extends BlocObserver {
  CounterObserver();

  Logger logger = Logger();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    logger.i("${bloc.runtimeType} : $change");
  }
}
