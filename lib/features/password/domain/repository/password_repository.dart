
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/core/data/response/success/success_response.dart';

abstract class IPasswordRepository {

  Future<NetworkState<SuccessResponse>> changePassword(
      String currentPassword, String newPassword);
}
