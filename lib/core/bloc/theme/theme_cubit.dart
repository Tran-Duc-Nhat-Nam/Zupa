import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/core/styles/theme.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const .initial(AppThemeMode.followSystem));

  final _storageService = getIt<StorageService>();

  Future<void> loadTheme() async {
    emit(.initial(await _storageService.getTheme()));
  }

  void changeTheme(AppThemeMode mode) {
    _storageService.setTheme(mode);
    emit(.initial(mode));
  }
}
