part of 'debugger_cubit.dart';

@freezed
sealed class DebuggerState with _$DebuggerState {
  const factory DebuggerState.initial() = _Initial;
  const factory DebuggerState.loaded(bool isDebuggerMode) = _Loaded;
}
