import 'dart:async';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:mocktail/mocktail.dart';
import 'package:zupa/core/bloc/connectivity/connectivity_cubit.dart';
import 'package:zupa/core/network/network_info.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late ConnectivityCubit connectivityCubit;
  late MockNetworkInfo mockNetworkInfo;
  late StreamController<InternetStatus> statusController;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    statusController = StreamController<InternetStatus>.broadcast();
    
    when(() => mockNetworkInfo.onStatusChanged)
        .thenAnswer((_) => statusController.stream);
    
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
        statusController.add(InternetStatus.disconnected);
        statusController.add(InternetStatus.connected);
      },
      expect: () => [
        const ConnectivityState.connected(),
        const ConnectivityState.disconnected(),
        const ConnectivityState.connected(),
      ],
    );
  });
}
