import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_state.freezed.dart';

@freezed
sealed class SecurityState with _$SecurityState {
  const factory SecurityState.initial() = Initial;

  const factory SecurityState.safe() = Safe;

  const factory SecurityState.vulnerable() = Vulnerable;
}
