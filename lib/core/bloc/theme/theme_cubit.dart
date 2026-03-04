import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/models/form/theme/theme_settings_form.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/core/styles/theme.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

@lazySingleton
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this._storageService) : super(const .initial());

  final StorageService _storageService;

  final formModel = ThemeSettingsForm(
    ThemeSettingsForm.formElements(ThemeSettings()),
    null,
    null,
  );

  Future<void> loadTheme() async {
    final settings = await _storageService.getTheme();
    emit(.loaded(settings));
    formModel.updateValue(settings);
  }

  void changeTheme() {
    final settings = ThemeSettings(
      themeMode: formModel.themeModeControl.value ?? AppThemeMode.system,
      colorSource:
          formModel.colorSourceControl.value ?? AppColorSchemeSource.brand,
      seedColorValue: formModel.seedColorValueControl.value,
    );
    _storageService.setTheme(settings);
    emit(.loaded(settings));
  }
}
