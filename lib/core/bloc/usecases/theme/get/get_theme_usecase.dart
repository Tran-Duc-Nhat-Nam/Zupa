import 'package:injectable/injectable.dart';
import 'package:zupa/core/models/form/theme/theme_settings_form.dart';
import 'package:zupa/core/services/storage_service.dart';

@injectable
class GetThemeUseCase {
  final StorageService _storageService;

  GetThemeUseCase(this._storageService);

  Future<ThemeSettings> call() async {
    return _storageService.getTheme();
  }
}
