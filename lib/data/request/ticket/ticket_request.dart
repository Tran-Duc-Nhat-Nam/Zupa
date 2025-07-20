import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_request.freezed.dart';
part 'ticket_request.g.dart';

@freezed
sealed class TicketRequest with _$TicketRequest {
  const factory TicketRequest({
    String? keyword,
    DateTime? time,
    int? typeId,
    @Default(0) int page,
    @Default(10) int size,
  }) = _TicketRequest;

  factory TicketRequest.fromJson(Map<String, dynamic> json) =>
      _$TicketRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();
}