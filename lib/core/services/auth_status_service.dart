import 'dart:async';
import 'package:injectable/injectable.dart';

@lazySingleton
class AuthStatusService {
  final _unauthorizedController = StreamController<void>.broadcast();

  Stream<void> get unauthorizedEvents => _unauthorizedController.stream;

  void notifyUnauthorized() {
    _unauthorizedController.add(null);
  }

  @disposeMethod
  void dispose() {
    _unauthorizedController.close();
  }
}
