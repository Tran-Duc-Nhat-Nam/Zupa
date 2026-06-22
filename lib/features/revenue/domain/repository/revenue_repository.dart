import 'package:zupa/core/data/models/request/request_state.dart';
import 'package:zupa/core/data/models/request/request_token.dart';
import 'package:zupa/features/revenue/domain/entities/daily_revenue_entity.dart';
import 'package:zupa/features/revenue/domain/usecases/get_revenue_params.dart';

abstract class IRevenueRepository {
  Future<RequestState<List<DailyRevenueEntity>>> getRevenue({
    required GetRevenueParams filter,
    RequestToken? token,
  });
}
