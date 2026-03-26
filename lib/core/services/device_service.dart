import 'package:device_info_plus/device_info_plus.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeviceService {
  Future<String> getDeviceAbi() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

    // supportedAbis is a list ordered by preference
    return androidInfo.supportedAbis.first;
  }
}
