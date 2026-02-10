import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Stream<InternetStatus> get onStatusChanged;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection _connection;

  NetworkInfoImpl(this._connection);

  @override
  Future<bool> get isConnected => _connection.hasInternetAccess;

  @override
  Stream<InternetStatus> get onStatusChanged => _connection.onStatusChange;
}