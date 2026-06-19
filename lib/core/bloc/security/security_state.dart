import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/services/security_service.dart';

part 'security_state.freezed.dart';

@freezed
sealed class SecurityState with _$SecurityState {
  const factory SecurityState.initial() = Initial;

  const factory SecurityState.safe({SecurityViolationReason? reason}) = Safe;

  const factory SecurityState.vulnerable({
    required SecurityViolationReason reason,
  }) = Vulnerable;
}
