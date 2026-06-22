import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/helper/services/storage_service.dart';

part 'animation_cubit.freezed.dart';
part 'animation_state.dart';

@lazySingleton
class AnimationCubit extends Cubit<AnimationState> {
  AnimationCubit(this._storageService) : super(const .loaded());

  final StorageService _storageService;

  Future<void> loadInfo() async =>
      emit(.loaded(isOn: await _storageService.getAnimation()));

  Future<void> changeAnimationMode(bool isOn) async {
    await _storageService.setAnimation(isOn);
    emit(.loaded(isOn: isOn));
  }
}
