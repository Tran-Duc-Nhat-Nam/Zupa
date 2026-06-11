part of 'animation_cubit.dart';

@freezed
sealed class AnimationState with _$AnimationState {
  const factory AnimationState.initial() = Initial;

  const factory AnimationState.loaded({@Default(true) bool isOn}) = Loaded;
}

extension AnimationStateExtension on AnimationState {
  bool get isOn => switch (this) {
    Loaded(:final isOn) => isOn,
    _ => true,
  };
}
