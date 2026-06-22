import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeviceService {
  Future<String> getDeviceAbi() async {
    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;

    return androidInfo.supportedAbis.first;
  }
}
