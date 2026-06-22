import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/features/theme/domain/entities/theme_settings_entity.dart';
import 'package:zupa/features/theme/domain/usecases/get/get_theme_usecase.dart';
import 'package:zupa/features/theme/domain/usecases/set/params/set_theme_params.dart';
import 'package:zupa/features/theme/domain/usecases/set/set_theme_usecase.dart';

part 'theme_cubit.freezed.dart';
part 'theme_state.dart';

@lazySingleton
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this._setTheme, this._getTheme) : super(const .loaded());

  final SetThemeUseCase _setTheme;
  final GetThemeUseCase _getTheme;

  Future<void> loadTheme() async => emit(.loaded(settings: await _getTheme()));

  Future<void> changeTheme({required SetThemeParams params}) async {
    await _setTheme(params: params);
    emit(.loaded(settings: await _getTheme()));
  }
}
