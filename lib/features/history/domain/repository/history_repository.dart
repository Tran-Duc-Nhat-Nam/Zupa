import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/history/domain/usecases/params/get_history_params.dart';
import 'package:zupa/features/history/domain/entities/history_ticket_entity.dart';

abstract class IHistoryRepository {
  Future<RequestState<List<HistoryTicketEntity>>> getHistory({
    required GetHistoryParams filter,
    RequestToken? token,
  });
}
