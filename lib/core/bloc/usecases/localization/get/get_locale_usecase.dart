import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/localization.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/services/storage_service.dart';

@injectable
class GetLocaleUseCase {
  final StorageService _storageService;

  GetLocaleUseCase(this._storageService);

  Future<AppLocalization> call() async {
    final mode = await _storageService.getLocalization();
    LocaleSettings.setLocaleRaw(mode.name);
    return mode;
  }
}
