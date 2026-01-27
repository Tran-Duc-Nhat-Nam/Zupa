import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/network/network_info.dart';

part 'connectivity_state.dart';
part 'connectivity_cubit.freezed.dart';

@injectable
class ConnectivityCubit extends Cubit<ConnectivityState> {
  final NetworkInfo _networkInfo;
  StreamSubscription? _subscription;

  ConnectivityCubit(this._networkInfo)
      : super(const ConnectivityState.initial());

  Future<void> monitorConnectivity() async {
    final isConnected = await _networkInfo.isConnected;
    if (isConnected) {
      emit(const ConnectivityState.connected());
    } else {
      emit(const ConnectivityState.disconnected());
    }

    _subscription = _networkInfo.onConnectivityChanged.listen((results) {
      if (results.contains(ConnectivityResult.none)) {
        emit(const ConnectivityState.disconnected());
      } else {
        emit(const ConnectivityState.connected());
      }
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
