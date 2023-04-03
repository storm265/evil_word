
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:evil_word/logic/home_screen/bloc/network_connection/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetCubit extends Cubit<InternetCubitState> {
  final Connectivity connectivity;

  InternetCubit({required this.connectivity}) : super(InternetDisconnectedState()) {
    connectivity.onConnectivityChanged.listen((connectivityResult) {
      connectivityResult == ConnectivityResult.none
          ? emit(InternetDisconnectedState())
          : emit(InternetConnectedState());
    });
  }
}
