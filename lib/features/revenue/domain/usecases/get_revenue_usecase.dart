import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/revenue/domain/entities/daily_revenue_entity.dart';
import 'package:zupa/features/revenue/domain/repository/revenue_repository.dart';
import 'package:zupa/features/revenue/domain/usecases/params/get_revenue_params.dart';

@injectable
class GetRevenueUseCase {
  final IRevenueRepository _repository;

  GetRevenueUseCase(this._repository);

  Future<RequestState<List<DailyRevenueEntity>>> call({
    required GetRevenueParams filter,
    RequestToken? token,
  }) async {
    return _repository.getRevenue(filter: filter, token: token);
  }
}
