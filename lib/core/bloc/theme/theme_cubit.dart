import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/bloc/usecases/theme/get/get_theme_usecase.dart';
import 'package:zupa/core/bloc/usecases/theme/set/params/set_theme_params.dart';
import 'package:zupa/core/bloc/usecases/theme/set/set_theme_usecase.dart';
import 'package:zupa/core/models/form/theme/theme_settings_form.dart';

part 'theme_cubit.freezed.dart';
part 'theme_state.dart';

@lazySingleton
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this._setTheme, this._getTheme) : super(const .initial());

  final SetThemeUseCase _setTheme;
  final GetThemeUseCase _getTheme;

  Future<void> loadTheme() async {
    final settings = await _getTheme();
    emit(.loaded(settings));
  }

  void changeTheme({required SetThemeParams params}) async {
    await _setTheme(params: params);
    final settings = await _getTheme();
    emit(.loaded(settings));
  }
}
