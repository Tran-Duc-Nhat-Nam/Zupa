part of 'animation_cubit.dart';

@freezed
sealed class AnimationState with _$AnimationState {
  const factory AnimationState.initial() = Initial;
  const factory AnimationState.loaded(bool isOn) = Loaded;
}
