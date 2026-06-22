import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zupa/core/constants/query.dart';

part 'ticket_request.freezed.dart';
part 'ticket_request.g.dart';

@freezed
sealed class TicketRequest with _$TicketRequest {
  const factory TicketRequest({
    String? keyword,
    DateTime? time,
    int? typeId,
    @Default(defaultPageIndex) int page,
    @Default(defaultPageSize) int size,
  }) = _TicketRequest;

  factory TicketRequest.fromJson(Map<String, dynamic> json) =>
      _$TicketRequestFromJson(json);

  @override
  Map<String, dynamic> toJson() => toJson();
}
