import '../../common/constants/shared_ref.dart';
import '../../data/request/account/account_request.dart';

class AuthHelper {
  static Future<void> setAuth(String accessToken) async {
    await sharedPreferences.setString('accessToken', accessToken);
  }

  static Future<String?> getAuth() async {
    return sharedPreferences.getString('accessToken');
  }

  static Future<void> removeAuth() async {
    await sharedPreferences.remove('accessToken');
  }

  static Future<void> saveAccountInfo(AccountRequest info) async {
    await sharedPreferences.setString('accountTenant', info.tenant);
    await sharedPreferences.setString('accountUsername', info.username);
    await sharedPreferences.setString('accountPassword', info.password);
  }

  static Future<AccountRequest> getAccountInfo() async {
    return AccountRequest(
      tenant: await sharedPreferences.getString('accountTenant') ?? '',
      username: await sharedPreferences.getString('accountUsername') ?? '',
      password: await sharedPreferences.getString('accountPassword') ?? '',);
  }

  static Future<void> removeAccountInfo() async {
    await sharedPreferences.remove('accountTenant');
    await sharedPreferences.remove('accountUsername');
    await sharedPreferences.remove('accountPassword');
  }
}