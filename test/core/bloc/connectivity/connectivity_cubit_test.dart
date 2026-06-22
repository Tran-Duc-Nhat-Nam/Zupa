import 'dart:async';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zupa/core/helper/services/network_service.dart';
import 'package:zupa/features/connectivity/presentation/bloc/connectivity_cubit.dart';

class MockNetworkInfoService extends Mock implements NetworkInfoService {}

void main() {
  late ConnectivityCubit connectivityCubit;
  late MockNetworkInfoService mockNetworkInfo;
  late StreamController<AppInternetStatus> statusController;

  setUp(() {
    mockNetworkInfo = MockNetworkInfoService();
    statusController = StreamController<AppInternetStatus>.broadcast();

    when(
      () => mockNetworkInfo.onStatusChanged,
    ).thenAnswer((_) => statusController.stream);

    connectivityCubit = ConnectivityCubit(mockNetworkInfo);
  });

  tearDown(() {
    connectivityCubit.close();
    statusController.close();
  });

  group('ConnectivityCubit Tests', () {
    test('initial state should be ConnectivityState.initial()', () {
      expect(connectivityCubit.state, const ConnectivityState.initial());
    });

    blocTest<ConnectivityCubit, ConnectivityState>(
      'should emit connected when initial check succeeds',
      build: () {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        return connectivityCubit;
      },
      act: (cubit) => cubit.monitorConnectivity(),
      expect: () => [const ConnectivityState.connected()],
    );

    blocTest<ConnectivityCubit, ConnectivityState>(
      'should emit disconnected when initial check fails',
      build: () {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        return connectivityCubit;
      },
      act: (cubit) => cubit.monitorConnectivity(),
      expect: () => [const ConnectivityState.disconnected()],
    );

    blocTest<ConnectivityCubit, ConnectivityState>(
      'should emit states based on status stream changes',
      build: () {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        return connectivityCubit;
      },
      act: (cubit) async {
        await cubit.monitorConnectivity();
        statusController.add(.disconnected);
        statusController.add(.connected);
      },
      expect: () => <ConnectivityState>[
        const .connected(),
        const .disconnected(),
        const .connected(),
      ],
    );
  });
}
