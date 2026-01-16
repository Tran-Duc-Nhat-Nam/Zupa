import '../../../../core/common/resource/network_state.dart';
import '../../data/models/daily_revenue.dart';
import '../entity/revenue_filter.dart';

abstract class IRevenueRepository {
  Future<NetworkState<List<DailyRevenue>>> getRevenue({
    int page = 1,
    int pageSize = 10,
    RevenueFilter? filter,
  });
}
