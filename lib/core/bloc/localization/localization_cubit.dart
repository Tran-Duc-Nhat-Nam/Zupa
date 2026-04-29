import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/bloc/usecases/localization/get/get_locale_usecase.dart';
import 'package:zupa/core/bloc/usecases/localization/set/set_locale_usecase.dart';
import 'package:zupa/core/constants/localization.dart';

part 'localization_cubit.freezed.dart';
part 'localization_state.dart';

@lazySingleton
class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit(this._setLocale, this._getLocale) : super(const .initial());

  final SetLocaleUseCase _setLocale;
  final GetLocaleUseCase _getLocale;

  Future<void> loadLocale() async {
    final mode = await _getLocale();
    emit(.loaded(mode));
  }

  void changeLocale(AppLocalization mode) {
    _setLocale(params: mode);
    emit(.loaded(mode));
  }
}
