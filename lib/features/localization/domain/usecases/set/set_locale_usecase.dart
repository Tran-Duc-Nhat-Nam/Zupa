import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/localization.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/helper/services/storage_service.dart';

@injectable
class SetLocaleUseCase {
  final StorageService _storageService;

  SetLocaleUseCase(this._storageService);

  Future<void> call({required AppLocalization params}) {
    LocaleSettings.setLocaleRaw(params.name);
    return _storageService.setLocalization(params);
  }
}
