import 'package:injectable/injectable.dart';
import 'package:zupa/core/bloc/usecases/ui_settings/set/params/set_ui_settings_params.dart';
import 'package:zupa/core/services/storage_service.dart';

@injectable
class SetUISettingsUseCase {
  final StorageService _storageService;

  SetUISettingsUseCase(this._storageService);

  Future<void> call({required SetUISettingsParams params}) async {
    return _storageService.setUISettings(params);
  }
}
