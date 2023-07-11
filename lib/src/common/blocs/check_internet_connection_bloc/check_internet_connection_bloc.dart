import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_check_service/internet_connection_check_service.dart';
import 'package:notes_app/src/common/common.dart';

part 'check_internet_connection_event.dart';
part 'check_internet_connection_state.dart';

class CheckInternetConnectionBloc
    extends Bloc<CheckInternetConnectionEvent, CheckInternetConnectionState> {
  CheckInternetConnectionBloc({
    required InternetConnectionCheckService internetConnectionCheckService,
    required NoteRepository noteRepository,
  })  : _internetConnectionCheckService = internetConnectionCheckService,
        _noteRepository = noteRepository,
        super(const CheckInternetConnectionState()) {
    on<StartCheckInternetConnection>(_startCheckInternetConnection);

    on<UpdateCheckInternetConnection>(_updateCheckInternetConnection);
  }

  final InternetConnectionCheckService _internetConnectionCheckService;
  final NoteRepository _noteRepository;

  StreamSubscription<ConnectionStatus>? _internetConnectionSubscription;

  Future<void> _startCheckInternetConnection(
    StartCheckInternetConnection event,
    Emitter<CheckInternetConnectionState> emit,
  ) async {
    _internetConnectionSubscription = _internetConnectionCheckService
        .checkInternetConnection()
        .listen((status) {
      add(UpdateCheckInternetConnection(connectionStatus: status));
    });
  }

  Future<void> _updateCheckInternetConnection(
    UpdateCheckInternetConnection event,
    Emitter<CheckInternetConnectionState> emit,
  ) async {
    emit(
      CheckInternetConnectionState(connectionStatus: event.connectionStatus),
    );
    if (state.connectionStatus == ConnectionStatus.connected) {
      await _noteRepository.syncNotes();
    }
  }

  @override
  Future<void> close() {
    _internetConnectionSubscription?.cancel();
    return super.close();
  }
}
