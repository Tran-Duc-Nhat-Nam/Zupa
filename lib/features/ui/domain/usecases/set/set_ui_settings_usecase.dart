import 'package:injectable/injectable.dart';
import 'package:zupa/core/helper/services/storage_service.dart';
import 'package:zupa/features/ui/domain/usecases/set/set_ui_settings_params.dart';

@injectable
class SetUISettingsUseCase {
  final StorageService _storageService;

  SetUISettingsUseCase(this._storageService);

  Future<void> call({required SetUISettingsParams params}) async =>
      _storageService.setUISettings(params);
}
