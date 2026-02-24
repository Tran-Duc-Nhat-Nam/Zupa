import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:zupa/core/network/network_info.dart';

part 'connectivity_state.dart';
part 'connectivity_cubit.freezed.dart';

@lazySingleton
class ConnectivityCubit extends Cubit<ConnectivityState> {
  final NetworkInfo _networkInfo;
  StreamSubscription? _subscription;

  ConnectivityCubit(this._networkInfo)
      : super(const .initial());

  Future<void> monitorConnectivity() async {
    // Initial check
    final isConnected = await _networkInfo.isConnected;
    _emitState(isConnected);

    // Listen for real-time changes
    _subscription = _networkInfo.onStatusChanged.listen((status) {
      if (status == InternetStatus.connected) {
        emit(const .connected());
      } else {
        emit(const .disconnected());
      }
    });
  }

  void _emitState(bool isConnected) {
    if (isConnected) {
      emit(const .connected());
    } else {
      emit(const .disconnected());
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}