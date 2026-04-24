import 'package:injectable/injectable.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/features/general_config/domain/usecases/set/params/set_general_config_params.dart';

@injectable
class SetGeneralConfigUseCase {
  final StorageService _storageService;

  SetGeneralConfigUseCase(this._storageService);

  Future<void> call({required SetGeneralConfigParams params}) async {
    _storageService.setWarningCapacity(params);

  }
}
