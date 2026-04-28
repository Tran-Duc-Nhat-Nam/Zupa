import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/resource/request_mapper.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/core/services/request_service.dart';
import 'package:zupa/features/home/data/api/home_api.dart';
import 'package:zupa/features/home/data/models/filter/home_filter_model.dart';
import 'package:zupa/features/home/data/models/ticket_model.dart';
import 'package:zupa/features/home/domain/usecases/params/get_ticket_params.dart';
import 'package:zupa/features/home/domain/entities/home_ticker_entity.dart';
import 'package:zupa/features/home/domain/repository/home_repository.dart';

@LazySingleton(as: IHomeRepository)
class HomeRepositoryImpl implements IHomeRepository {
  final HomeAPI _api;
  final RequestService _networkService;

  HomeRepositoryImpl(this._networkService, this._api);

  @override
  Future<RequestState<List<HomeTicketEntity>>> getTickets({
    required GetTicketParams filter,
    RequestToken? token,
  }) async {
    final response = await _networkService.request(
      request: (cancelToken) => _api.getList(
        payload: HomeFilterModel.fromEntity(filter),
        cancelToken: cancelToken,
      ),
      token: token,
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
      return response.toNetworkState<List<HomeTicketEntity>>();
    } else {
      return const .error('error');
    }
  }
}
