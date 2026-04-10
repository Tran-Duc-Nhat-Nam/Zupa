import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/revenue/domain/entities/daily_revenue_entity.dart';
import 'package:zupa/features/revenue/domain/usecases/params/get_revenue_params.dart';

abstract class IRevenueRepository {
  Future<NetworkState<List<DailyRevenueEntity>>> getRevenue({
    required GetRevenueParams filter,
  });
}
