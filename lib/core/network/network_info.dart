import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;

  Stream<AppInternetStatus> get onStatusChanged;
}

enum AppInternetStatus { connected, disconnected }

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection _connection;

  NetworkInfoImpl(this._connection);

  @override
  Future<bool> get isConnected => _connection.hasInternetAccess;

  @override
  Stream<AppInternetStatus> get onStatusChanged => _connection.onStatusChange
      .map((status) => status == .connected ? .connected : .disconnected);
}
