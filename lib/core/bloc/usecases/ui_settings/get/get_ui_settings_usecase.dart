import 'package:injectable/injectable.dart';
import 'package:zupa/core/entities/ui_settings_entity.dart';
import 'package:zupa/core/services/storage_service.dart';

@injectable
class GetUISettingsUseCase {
  final StorageService _storageService;

  GetUISettingsUseCase(this._storageService);

  Future<UISettingsEntity> call() async {
    return _storageService.getUISettings();
  }
}
