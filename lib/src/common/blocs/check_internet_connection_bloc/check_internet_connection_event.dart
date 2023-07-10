part of 'check_internet_connection_bloc.dart';

abstract class CheckInternetConnectionEvent extends Equatable {
  const CheckInternetConnectionEvent();

  @override
  List<Object> get props => [];
}

class StartCheckInternetConnection extends CheckInternetConnectionEvent {}

class UpdateCheckInternetConnection extends CheckInternetConnectionEvent {
  const UpdateCheckInternetConnection({
    required this.connectionStatus,
  });

  final ConnectionStatus connectionStatus;

  @override
  List<Object> get props => [connectionStatus];
}
