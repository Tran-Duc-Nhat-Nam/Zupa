import '../../common/constants/shared_ref.dart';

abstract class AuthHelper {
  static Future<void> setAuth(String accessToken) async {
    await sharedPreferences.setString('accessToken', accessToken);
  }

  static Future<String?> getAuth() async {
    return sharedPreferences.getString('accessToken');
  }

  static Future<void> removeAuth() async {
    await sharedPreferences.remove('accessToken');
  }
}