import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_response.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/core/services/request_service.dart';
import 'package:zupa/features/revenue/data/api/revenue_api.dart';
import 'package:zupa/features/revenue/domain/entities/daily_revenue_entity.dart';
import 'package:zupa/features/revenue/domain/repository/revenue_repository.dart';
import 'package:zupa/features/revenue/domain/usecases/params/get_revenue_params.dart';

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

    return response.maybeWhen(
      success: (data) => .success(data.data.map((e) => e.toEntity()).toList()),
      failure: (error) => .error(error.errorMessage),
      cancelled: () => const .error('cancelled'),
      orElse: () => const .error('unknown_response'),
    );
  }
}
