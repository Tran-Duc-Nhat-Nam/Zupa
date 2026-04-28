import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/revenue/domain/entities/daily_revenue_entity.dart';
import 'package:zupa/features/revenue/domain/usecases/params/get_revenue_params.dart';

abstract class IRevenueRepository {
  Future<RequestState<List<DailyRevenueEntity>>> getRevenue({
    required GetRevenueParams filter,
    RequestToken? token,
  });
}
