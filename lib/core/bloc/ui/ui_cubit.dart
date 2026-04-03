import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/entities/ui_settings_entity.dart';
import 'package:zupa/core/models/form/ui/ui_settings_form.dart';
import 'package:zupa/core/services/storage_service.dart';

part 'ui_cubit.freezed.dart';
part 'ui_state.dart';

@lazySingleton
class UICubit extends Cubit<UIState> {
  final formModel = UISettingsForm(
    UISettingsForm.formElements(
      UISettings(
        isFloatingNavbar: false,
        isShowNavbarLabel: false,
        isGlassmorphism: false,
      ),
    ),
    null,
    null,
  );

  UICubit(this._storageService) : super(const .initial());

  final StorageService _storageService;

  Future<void> loadInfo() async {
    final settings = await _storageService.getUISettings();
    emit(.loaded(settings: settings));
    formModel.updateValue(
      UISettings(
        isFloatingNavbar: settings.isFloatingNavbar,
        isShowNavbarLabel: settings.isShowNavbarLabel,
        isGlassmorphism: settings.isGlassmorphism,
      ),
    );
  }

  void changeUIMode() {
    final settings = UISettingsEntity(
      isFloatingNavbar: formModel.isFloatingNavbarControl.value ?? false,
      isShowNavbarLabel: formModel.isShowNavbarLabelControl.value ?? true,
      isGlassmorphism: formModel.isGlassmorphismControl.value ?? false,
    );
    _storageService.setUISettings(settings);
    emit(.loaded(settings: settings));
  }
}
