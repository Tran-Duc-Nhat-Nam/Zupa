import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

enum AppInternetStatus { connected, disconnected }

@LazySingleton()
class NetworkInfoService {
  final InternetConnection _connection;

  NetworkInfoService(this._connection);

  Future<bool> get isConnected => _connection.hasInternetAccess;

  Stream<AppInternetStatus> get onStatusChanged => _connection.onStatusChange
      .map((status) => status == .connected ? .connected : .disconnected);
}
