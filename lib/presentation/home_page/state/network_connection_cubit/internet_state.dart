import 'package:equatable/equatable.dart';

class InternetCubitState extends Equatable {
  const InternetCubitState();

  @override
  List<Object> get props => [];
}

class InternetConnectedState extends InternetCubitState {
  const InternetConnectedState();
}

class InternetDisconnectedState extends InternetCubitState {
  const InternetDisconnectedState();
}
