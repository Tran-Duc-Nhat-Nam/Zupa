import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/resource/network_state.dart';
import '../../../../core/services/network_service.dart';
import '../../../../data/request/request.dart';
import '../../../../data/response/success/success_response.dart';
import '../../../../data/response/error/error_response.dart';
import '../../domain/repository/history_repository.dart';
import '../api/history_api.dart';
import '../models/history_ticket.dart';
import '../../presentation/bloc/filter/model/history_filter.dart';

@LazySingleton(as: IHistoryRepository)
class HistoryRepositoryImpl implements IHistoryRepository {
  final HistoryAPI _api;
  final NetworkService _networkService;

  HistoryRepositoryImpl(this._networkService, Dio dio) : _api = HistoryAPI(dio);

  @override
  Future<NetworkState<List<HistoryTicket>>> getHistory({
    int page = 1,
    int pageSize = 10,
    HistoryFilter? filter,
  }) async {
    final response = await _networkService.request(
      (dio) => _api.getList(
        Request(page: page, size: pageSize, query: filter?.toJson()),
      ),
    );

    if (response is SuccessResponse) {
      try {
        final List<dynamic> dataList = response.data['data'] as List<dynamic>;
        final items = dataList
            .map((e) => HistoryTicket.fromJson(e as Map<String, dynamic>))
            .toList();
        return NetworkState.success(items);
      } catch (e) {
        return NetworkState.error('Parsing Error: ${e.toString()}');
      }
    } else if (response is ErrorResponse) {
      return NetworkState.error(response.message);
    } else {
      return const NetworkState.error('Unknown Response Type');
    }
  }
}
