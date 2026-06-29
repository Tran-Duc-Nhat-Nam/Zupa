import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/localization.dart';
import 'package:zupa/features/localization/domain/usecases/get/get_locale_usecase.dart';
import 'package:zupa/features/localization/domain/usecases/set/set_locale_usecase.dart';

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

  Future<void> changeLocale(AppLocalization mode) async {
    await _setLocale(params: mode);
    emit(.loaded(mode));
  }
}
