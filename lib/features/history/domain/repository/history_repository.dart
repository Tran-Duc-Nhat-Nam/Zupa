import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/history/domain/usecases/params/get_history_params.dart';
import 'package:zupa/features/history/domain/entities/history_ticket_entity.dart';

abstract class IHistoryRepository {
  Future<NetworkState<List<HistoryTicketEntity>>> getHistory({
    int page,
    int pageSize,
    GetHistoryParams filter,
  });
}
