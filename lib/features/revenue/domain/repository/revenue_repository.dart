import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/revenue/domain/entities/daily_revenue_entity.dart';
import 'package:zupa/features/revenue/domain/entities/filter/revenue_filter_entity.dart';

abstract class IRevenueRepository {
  Future<NetworkState<List<DailyRevenueEntity>>> getRevenue({
    required RevenueFilterEntity filter,
  });
}
