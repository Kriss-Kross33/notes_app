part of 'check_internet_connection_bloc.dart';

class CheckInternetConnectionState extends Equatable {
  const CheckInternetConnectionState({
    this.connectionStatus = ConnectionStatus.connected,
  });
  final ConnectionStatus connectionStatus;

  CheckInternetConnectionState copyWith({
    ConnectionStatus? connectionStatus,
  }) {
    return CheckInternetConnectionState(
      connectionStatus: connectionStatus ?? this.connectionStatus,
    );
  }

  @override
  List<Object> get props => [connectionStatus];
}
