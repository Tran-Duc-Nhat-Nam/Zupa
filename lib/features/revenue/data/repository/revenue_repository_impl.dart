import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/models/request/request_response.dart';
import 'package:zupa/core/data/models/request/request_state.dart';
import 'package:zupa/core/data/models/request/request_token.dart';
import 'package:zupa/core/helper/services/request_service.dart';
import 'package:zupa/features/revenue/data/api/revenue_api.dart';
import 'package:zupa/features/revenue/domain/entities/daily_revenue_entity.dart';
import 'package:zupa/features/revenue/domain/repository/revenue_repository.dart';
import 'package:zupa/features/revenue/domain/usecases/get_revenue_params.dart';

@LazySingleton(as: IRevenueRepository)
class RevenueRepositoryImpl with RequestService implements IRevenueRepository {
  final RevenueAPI _api;

  RevenueRepositoryImpl(this._api);

  @override
  Future<RequestState<List<DailyRevenueEntity>>> getRevenue({
    required GetRevenueParams filter,
    RequestToken? token,
  }) async {
    final response = await request(
      request: (cancelToken) =>
          _api.getList(payload: .fromEntity(filter), cancelToken: cancelToken),
      token: token,
    );

    return response.when(
      success: (data) => Success(data.data.map((e) => e.toEntity()).toList()),
      failure: (error) => Error(code: error.code, message: error.errorMessage),
      cancelled: () => const Error(code: -1, message: 'cancelled'),
    );
  }
}
