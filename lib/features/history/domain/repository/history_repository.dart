import '../../../../core/common/resource/network_state.dart';
import '../../data/models/history_ticket.dart';
import '../../presentation/bloc/filter/model/history_filter.dart';

abstract class IHistoryRepository {
  Future<NetworkState<List<HistoryTicket>>> getHistory({
    int page = 1,
    int pageSize = 10,
    HistoryFilter? filter,
  });
}
