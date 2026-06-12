import 'package:injectable/injectable.dart';
import 'package:zupa/core/entities/theme_settings_entity.dart';
import 'package:zupa/core/services/storage_service.dart';

@injectable
class GetThemeUseCase {
  final StorageService _storageService;

  GetThemeUseCase(this._storageService);

  Future<ThemeSettingsEntity> call() async => _storageService.getTheme();
}
