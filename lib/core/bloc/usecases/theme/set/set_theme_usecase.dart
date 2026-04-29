import 'package:injectable/injectable.dart';
import 'package:zupa/core/bloc/usecases/theme/set/params/set_theme_params.dart';
import 'package:zupa/core/services/storage_service.dart';

@injectable
class SetThemeUseCase {
  final StorageService _storageService;

  SetThemeUseCase(this._storageService);

  Future<void> call({required SetThemeParams params}) async {
    return _storageService.setTheme(params: params);
  }
}
