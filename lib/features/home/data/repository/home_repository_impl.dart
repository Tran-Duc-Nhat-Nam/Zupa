import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/core/services/network_service.dart';
import 'package:zupa/features/home/data/api/home_api.dart';
import 'package:zupa/features/home/data/models/filter/home_filter_model.dart';
import 'package:zupa/features/home/data/models/ticket_model.dart';
import 'package:zupa/features/home/domain/usecases/params/get_ticket_params.dart';
import 'package:zupa/features/home/domain/entities/home_ticker_entity.dart';
import 'package:zupa/features/home/domain/repository/home_repository.dart';

@LazySingleton(as: IHomeRepository)
class HomeRepositoryImpl implements IHomeRepository {
  final HomeAPI _api;
  final NetworkService _networkService;

  HomeRepositoryImpl(this._networkService, this._api);

  @override
  Future<NetworkState<List<HomeTicketEntity>>> getTickets({
    int page = 0,
    int pageSize = 10,
    GetTicketParams filter = const GetTicketParams(
      page: defaultPageIndex,
      size: defaultPageSize,
      keyword: null,
      time: null,
      type: null,
    ),
  }) async {
    final response = await _networkService.request(
      (dio) => _api.getList(HomeFilterModel.fromEntity(filter)),
    );

    if (response is SuccessResponse<List<HomeTicketModel>>) {
      try {
        final tickets = response.data
            .map<HomeTicketEntity>((e) => e.toEntity())
            .toList();
        return .success(tickets);
      } catch (e) {
        return .error(e.toString());
      }
    } else if (response is ErrorResponse) {
      if (response.code == 4001) {
        return const .unauthenticated();
      } else {
        return .error(response.message);
      }
    } else {
      return const .error('error');
    }
  }
}
