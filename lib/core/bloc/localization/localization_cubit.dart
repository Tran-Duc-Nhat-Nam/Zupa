import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/di/injection.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/core/styles/localization.dart';

part 'localization_state.dart';
part 'localization_cubit.freezed.dart';

class LocalizationCubit extends Cubit<LocalizationState> {
  LocalizationCubit() : super(const .initial());

  final _storageService = getIt<StorageService>();

  Future<void> loadLocale() async {
    emit(.loaded(await _storageService.getLocalization()));
  }

  void changeLocale(AppLocalization mode) {
    _storageService.setLocalization(mode);
    emit(.loading(mode));
    emit(.loaded(mode));
  }
}
