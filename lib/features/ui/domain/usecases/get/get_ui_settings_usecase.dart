import 'package:injectable/injectable.dart';
import 'package:zupa/core/helper/services/storage_service.dart';
import 'package:zupa/features/ui/domain/entities/ui_settings_entity.dart';

@injectable
class GetUISettingsUseCase {
  final StorageService _storageService;

  GetUISettingsUseCase(this._storageService);

  Future<UISettingsEntity> call() async => _storageService.getUISettings();
}
