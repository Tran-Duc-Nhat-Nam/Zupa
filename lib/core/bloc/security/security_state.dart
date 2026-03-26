import 'package:freezed_annotation/freezed_annotation.dart';

part 'security_state.freezed.dart';

@freezed
class SecurityState with _$SecurityState {
  const factory SecurityState.initial() = _Initial;

  const factory SecurityState.safe() = _Safe;

  const factory SecurityState.vulnerable() = _Vulnerable;
}
