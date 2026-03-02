import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/core/services/network_service.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/features/password/data/api/password_api.dart';
import 'package:zupa/features/password/data/models/change_password_request.dart';
import 'package:zupa/features/password/domain/repository/password_repository.dart';

@LazySingleton(as: IPasswordRepository)
class PasswordRepositoryImpl implements IPasswordRepository {
  final PasswordAPI _api;
  final NetworkService _networkService;

  PasswordRepositoryImpl(this._networkService, this._api);

  @override
  Future<NetworkState<SuccessResponse>> changePassword(
    String id,
    String currentPassword,
    String newPassword,
  ) async {
    final payload = ChangePasswordRequest(
      oldPassword: currentPassword,
      newPassword: newPassword,
    );

    try {
      final response = await _networkService.request(
        (dio) => _api.changePassword(id, payload),
      );

      if (response is SuccessResponse) {
        return .success(response.data);
      } else if (response is ErrorResponse) {
        return .error(response.message);
      } else {
        return const .error('error');
      }
    } catch (e) {
      return .error(e.toString());
    }
  }
}
