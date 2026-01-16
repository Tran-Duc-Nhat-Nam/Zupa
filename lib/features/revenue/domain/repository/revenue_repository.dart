import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/revenue/data/models/daily_revenue.dart';
import 'package:zupa/features/revenue/domain/entity/revenue_filter.dart';

abstract class IRevenueRepository {
  Future<NetworkState<List<DailyRevenue>>> getRevenue({
    int page = 1,
    int pageSize = 10,
    RevenueFilter? filter,
  });
}
