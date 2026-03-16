import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/history/domain/entities/filter/history_filter_entity.dart';
import 'package:zupa/features/history/domain/entities/history_ticket_entity.dart';

abstract class IHistoryRepository {
  Future<NetworkState<List<HistoryTicketEntity>>> getHistory({
    int page,
    int pageSize,
    HistoryFilterEntity filter,
  });
}
