import 'dart:async';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zupa/core/services/auth_status_service.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart';

class MockStorageService extends Mock implements StorageService {}
class MockAuthStatusService extends Mock implements AuthStatusService {}

void main() {
  late AuthCubit authCubit;
  late MockStorageService mockStorageService;
  late MockAuthStatusService mockAuthStatusService;
  late StreamController<void> unauthorizedController;

  setUp(() {
    mockStorageService = MockStorageService();
    mockAuthStatusService = MockAuthStatusService();
    unauthorizedController = StreamController<void>.broadcast();

    when(() => mockAuthStatusService.unauthorizedEvents)
        .thenAnswer((_) => unauthorizedController.stream);

    authCubit = AuthCubit(mockStorageService, mockAuthStatusService);
  });

  tearDown(() {
    authCubit.close();
    unauthorizedController.close();
  });

  group('AuthCubit Tests', () {
    test('initial state should be AuthState.initial', () {
      expect(authCubit.state, const AuthState.initial());
    });

    blocTest<AuthCubit, AuthState>(
      'loadAuth should emit loaded state with biometric status',
      build: () {
        when(() => mockStorageService.getBiometricAuth()).thenAnswer((_) async => true);
        return authCubit;
      },
      act: (cubit) => cubit.loadAuth(),
      expect: () => [const AuthState.loaded(true)],
    );

    blocTest<AuthCubit, AuthState>(
      'logOut should clear token and emit noAuthenticated',
      build: () {
        when(() => mockStorageService.removeAuth()).thenAnswer((_) async => null);
        return authCubit;
      },
      act: (cubit) => cubit.logOut(),
      expect: () => [const AuthState.noAuthenticated()],
      verify: (_) {
        verify(() => mockStorageService.removeAuth()).called(1);
      },
    );

    blocTest<AuthCubit, AuthState>(
      'should trigger logOut when unauthorized event is received',
      build: () {
        when(() => mockStorageService.removeAuth()).thenAnswer((_) async => null);
        return authCubit;
      },
      act: (cubit) {
        unauthorizedController.add(null);
      },
      expect: () => [const AuthState.noAuthenticated()],
      verify: (_) {
        verify(() => mockStorageService.removeAuth()).called(1);
      },
    );
  });
}
