import "package:bloc/bloc.dart";
import "package:logger/logger.dart";

/// [GeneralObserver] for the counter application which observes all state changes and logs them.
class GeneralObserver extends BlocObserver {
  GeneralObserver();

  Logger logger = Logger();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    logger.i("${bloc.runtimeType} : $change");
  }
}
