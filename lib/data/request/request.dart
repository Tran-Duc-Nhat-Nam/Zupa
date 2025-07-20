import 'package:freezed_annotation/freezed_annotation.dart';

part 'request.freezed.dart';
part 'request.g.dart';

@freezed
sealed class Request with _$Request {
  const factory Request({
    @Default(0) int page,
    @Default(10) int size,
  }) = _Request;

  factory Request.fromJson(Map<String, Object?> json)
  => _$RequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();
}