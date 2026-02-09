
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/core/services/network_service.dart';
import 'package:zupa/core/data/request/request.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/features/revenue/domain/repository/revenue_repository.dart';
import 'package:zupa/features/revenue/data/api/revenue_api.dart';
import 'package:zupa/features/revenue/data/models/daily_revenue.dart';
import 'package:zupa/features/revenue/domain/entity/revenue_filter.dart';

@LazySingleton(as: IRevenueRepository)
class RevenueRepositoryImpl implements IRevenueRepository {
  final RevenueAPI _api;
  final NetworkService _networkService;

  RevenueRepositoryImpl(this._networkService, this._api);

  @override
  Future<NetworkState<List<DailyRevenue>>> getRevenue({
    int page = 1,
    int pageSize = 10,
    RevenueFilter? filter,
  }) async {
    final response = await _networkService.request(
      (dio) => _api.getList(
        Request(page: page, size: pageSize, query: filter?.toJson()),
      ),
    );

    if (response is SuccessResponse<List<DailyRevenue>>) {
      return NetworkState.success(response.data);
    } else if (response is ErrorResponse) {
      return NetworkState.error(response.message);
    } else {
      return const NetworkState.error('error');
    }
  }
}
