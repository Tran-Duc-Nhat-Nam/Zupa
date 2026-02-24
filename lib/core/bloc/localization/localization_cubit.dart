import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/core/constants/localization.dart';
import 'package:zupa/core/models/form/localization/app_settings_form.dart';

part 'localization_state.dart';
part 'localization_cubit.freezed.dart';

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
    emit(.loaded(await _storageService.getLocalization()));
  }

  void changeLocale() {
    final mode = formModel.localizationModeControl.value ?? AppLocalization.followSystem;
    _storageService.setLocalization(mode);
    emit(.loading(mode));
    emit(.loaded(mode));
  }
}
