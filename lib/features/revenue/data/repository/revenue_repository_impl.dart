import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/core/services/request_service.dart';
import 'package:zupa/features/revenue/data/api/revenue_api.dart';
import 'package:zupa/features/revenue/domain/entities/daily_revenue_entity.dart';
import 'package:zupa/features/revenue/domain/repository/revenue_repository.dart';
import 'package:zupa/features/revenue/domain/usecases/params/get_revenue_params.dart';

@LazySingleton(as: IRevenueRepository)
class RevenueRepositoryImpl implements IRevenueRepository {
  final RevenueAPI _api;
  final RequestService _networkService;

  RevenueRepositoryImpl(this._networkService, this._api);

  @override
  Future<RequestState<List<DailyRevenueEntity>>> getRevenue({
    required GetRevenueParams filter,
    RequestToken? token,
  }) async {
    final response = await _networkService.request(
      request: (cancelToken) =>
          _api.getList(payload: .fromEntity(filter), cancelToken: cancelToken),
      token: token,
    );

    if (response is SuccessResponse<List<DailyRevenueEntity>>) {
      return .success(response.data);
    } else if (response is ErrorResponse) {
      return .error(response.message);
    } else {
      return const .error('error');
    }
  }
}
