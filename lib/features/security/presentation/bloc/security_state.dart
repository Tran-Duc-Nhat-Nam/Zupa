part of 'security_cubit.dart';

@freezed
sealed class SecurityState with _$SecurityState {
  const factory SecurityState.initial() = Initial;

  const factory SecurityState.safe({SecurityViolationReason? reason}) = Safe;

  const factory SecurityState.vulnerable({
    required SecurityViolationReason reason,
  }) = Vulnerable;
}
