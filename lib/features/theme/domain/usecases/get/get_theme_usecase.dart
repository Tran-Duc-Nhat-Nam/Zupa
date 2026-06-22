import 'package:injectable/injectable.dart';
import 'package:zupa/core/helper/services/storage_service.dart';
import 'package:zupa/features/theme/domain/entities/theme_settings_entity.dart';

@injectable
class GetThemeUseCase {
  final StorageService _storageService;

  GetThemeUseCase(this._storageService);

  Future<ThemeSettingsEntity> call() async => _storageService.getTheme();
}
