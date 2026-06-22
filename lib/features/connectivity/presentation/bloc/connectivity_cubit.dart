import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/helper/services/network_service.dart';

part 'connectivity_cubit.freezed.dart';
part 'connectivity_state.dart';

@lazySingleton
class ConnectivityCubit extends Cubit<ConnectivityState> {
  final NetworkInfoService _networkInfo;
  StreamSubscription? _subscription;

  ConnectivityCubit(this._networkInfo) : super(const .initial());

  Future<void> monitorConnectivity() async {
    // Initial check
    _emitState(await _networkInfo.isConnected);

    // Listen for real-time changes
    _subscription = _networkInfo.onStatusChanged.listen(
      (status) => _emitState(status == .connected),
    );
  }

  void _emitState(bool isConnected) =>
      emit(isConnected ? const .connected() : const .disconnected());

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
