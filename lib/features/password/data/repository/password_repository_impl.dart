import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/core/services/network_service.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/features/password/data/api/password_api.dart';
import 'package:zupa/features/password/domain/repository/password_repository.dart';

@LazySingleton(as: IPasswordRepository)
class PasswordRepositoryImpl implements IPasswordRepository {
  final PasswordAPI _api;
  final NetworkService _networkService;

  PasswordRepositoryImpl(this._networkService, this._api);

  @override
  Future<NetworkState<SuccessResponse>> changePassword(
      String currentPassword,
      String newPassword,
      ) async {
    // Placeholder for API call
    return const .success(.new(data: null));
  }
}
