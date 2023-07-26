import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:evil_word/presentation/home_page/state/network_connection_cubit/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetCubitState> {
  final Connectivity connectivity;

  InternetCubit({required this.connectivity})
      : super(const InternetDisconnectedState()) {
    connectivity.onConnectivityChanged.listen((connectivityResult) {
      connectivityResult == ConnectivityResult.none
          ? emit(const InternetDisconnectedState())
          : emit(const InternetConnectedState());
    });
  }
}
