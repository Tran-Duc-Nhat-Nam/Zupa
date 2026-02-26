import 'package:flutter_test/flutter_test.dart';
import 'package:zupa/core/services/auth_status_service.dart';

void main() {
  late AuthStatusService authStatusService;

  setUp(() {
    authStatusService = AuthStatusService();
  });

  tearDown(() {
    authStatusService.dispose();
  });

  group('AuthStatusService Tests', () {
    test('unauthorizedEvents should emit when notifyUnauthorized is called', () {
      expect(authStatusService.unauthorizedEvents, emits(null));
      authStatusService.notifyUnauthorized();
    });

    test('unauthorizedEvents should be a broadcast stream', () {
      authStatusService.unauthorizedEvents.listen((_) {});
      authStatusService.unauthorizedEvents.listen((_) {});
      // If it's not a broadcast stream, the second listen would throw an error.
      // This test is mostly a sanity check.
    });
  });
}
