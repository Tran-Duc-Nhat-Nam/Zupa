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
    emit(.loaded(await _storageService.getTheme()));
  }

  void changeTheme() {
    final mode = formModel.themeModeControl.value ?? AppThemeMode.followSystem;
    _storageService.setTheme(mode);
    emit(.loaded(mode));
  }
}
