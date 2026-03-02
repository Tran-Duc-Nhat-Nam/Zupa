import 'package:zupa/core/data/models/user/user.dart';
import 'package:zupa/core/resource/network_state.dart';

abstract class IPasswordRepository {
  Future<NetworkState<User>> changePassword(
    String id,
    String currentPassword,
    String newPassword,
  );
}
