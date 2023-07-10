import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    debugPrint(stackTrace.toString());
    debugPrint(error.toString());
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    debugPrint(transition.toString());
    super.onTransition(bloc, transition);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    debugPrint(change.toString());
    super.onChange(bloc, change);
  }

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    debugPrint(event.toString());
    super.onEvent(bloc, event);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    debugPrint('${bloc}Closed');
    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase<dynamic> bloc) {
    debugPrint('${bloc}Created');
    super.onCreate(bloc);
  }
}
