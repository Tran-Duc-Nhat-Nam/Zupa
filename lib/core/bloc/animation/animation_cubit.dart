import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/services/storage_service.dart';

part 'animation_cubit.freezed.dart';
part 'animation_state.dart';

@lazySingleton
class AnimationCubit extends Cubit<AnimationState> {
  AnimationCubit(this._storageService) : super(const AnimationState.initial());

  final StorageService _storageService;

  Future<void> loadInfo() async {
    emit(AnimationState.loaded(await _storageService.getAnimation()));
  }

  void changeAnimationMode(bool isOn) {
    _storageService.setAnimation(isOn);
    emit(AnimationState.loaded(isOn));
  }
}
