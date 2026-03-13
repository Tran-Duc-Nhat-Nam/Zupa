import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/history/domain/entities/history_filter.dart';
import 'package:zupa/features/history/domain/entities/history_ticket_entity.dart';

abstract class IHistoryRepository {
  Future<NetworkState<List<HistoryTicketEntity>>> getHistory({
    int page = 1,
    int pageSize = 10,
    HistoryFilter? filter,
  });
}
