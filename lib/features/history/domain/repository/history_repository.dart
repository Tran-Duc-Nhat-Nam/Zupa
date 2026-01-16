import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/history/data/models/history_ticket.dart';
import 'package:zupa/features/history/presentation/bloc/filter/model/history_filter.dart';

abstract class IHistoryRepository {
  Future<NetworkState<List<HistoryTicket>>> getHistory({
    int page = 1,
    int pageSize = 10,
    HistoryFilter? filter,
  });
}
