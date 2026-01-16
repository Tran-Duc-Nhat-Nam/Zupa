import 'package:freezed_annotation/freezed_annotation.dart';

part 'request.freezed.dart';
part 'request.g.dart';

@freezed
sealed class Request with _$Request {
  const factory Request({
    @Default(1) int page,
    @Default(10) int size,
    Map<String, dynamic>? query,
  }) = _Request;

  factory Request.fromJson(Map<String, Object?> json) =>
      _$RequestFromJson(json);
}
