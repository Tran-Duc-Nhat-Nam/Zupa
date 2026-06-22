import 'package:injectable/injectable.dart';
import 'package:zupa/core/helper/services/storage_service.dart';
import 'package:zupa/features/theme/domain/usecases/set/params/set_theme_params.dart';

@injectable
class SetThemeUseCase {
  final StorageService _storageService;

  SetThemeUseCase(this._storageService);

  Future<void> call({required SetThemeParams params}) async =>
      _storageService.setTheme(params: params);
}
