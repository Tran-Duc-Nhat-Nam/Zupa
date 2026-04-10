import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/revenue/domain/entities/daily_revenue_entity.dart';
import 'package:zupa/features/revenue/domain/usecases/params/get_revenue_params.dart';
import 'package:zupa/features/revenue/domain/repository/revenue_repository.dart';

@injectable
class GetRevenueUseCase {
  final IRevenueRepository _repository;

  GetRevenueUseCase(this._repository);

  Future<NetworkState<List<DailyRevenueEntity>>> call({
    required GetRevenueParams filter,
  }) async {
    return _repository.getRevenue(filter: filter);
  }
}

