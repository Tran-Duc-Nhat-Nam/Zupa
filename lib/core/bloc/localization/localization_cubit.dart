import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/localization.dart';
import 'package:zupa/core/i18n/gen/strings.g.dart';
import 'package:zupa/core/models/form/localization/app_settings_form.dart';
import 'package:zupa/core/services/storage_service.dart';

part 'localization_cubit.freezed.dart';
part 'localization_state.dart';

@lazySingleton
class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit(this._storageService) : super(const .initial());

  final StorageService _storageService;

  final formModel = AppSettingsForm(
    AppSettingsForm.formElements(AppSettings()),
    null,
    null,
  );

  Future<void> loadLocale() async {
    final mode = await _storageService.getLocalization();
    LocaleSettings.setLocaleRaw(mode.name);
    emit(.loaded(mode));
  }

  void changeLocale() {
    final mode = formModel.localizationModeControl.value ?? .followSystem;
    _storageService.setLocalization(mode);
    LocaleSettings.setLocaleRaw(mode.name);
    emit(.loaded(mode));
  }
}
