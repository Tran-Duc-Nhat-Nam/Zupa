part of 'animation_cubit.dart';

@freezed
sealed class AnimationState with _$AnimationState {
  const factory AnimationState.initial() = AnimationInitial;

  const factory AnimationState.loaded({@Default(true) bool isOn}) = AnimationLoaded;
}

extension AnimationStateExtension on AnimationState {
  bool get isOn => switch (this) {
    AnimationLoaded(:final isOn) => isOn,
    _ => true,
  };
}
