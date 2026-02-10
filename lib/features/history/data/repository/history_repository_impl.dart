import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/core/services/network_service.dart';
import 'package:zupa/core/data/request/request.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/features/history/domain/repository/history_repository.dart';
import 'package:zupa/features/history/data/api/history_api.dart';
import 'package:zupa/features/history/data/models/history_ticket.dart';
import 'package:zupa/features/history/domain/entities/history_filter.dart';

@LazySingleton(as: IHistoryRepository)
class HistoryRepositoryImpl implements IHistoryRepository {
  final HistoryAPI _api;
  final NetworkService _networkService;

  HistoryRepositoryImpl(this._networkService, this._api);

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

    if (response is SuccessResponse<List<HistoryTicket>>) {
      try {
        final List<HistoryTicket> items = response.data;
        return .success(items);
      } catch (e) {
        return .error('Parsing Error: ${e.toString()}');
      }
    } else if (response is ErrorResponse) {
      return .error(response.message);
    } else {
      return const .error('Unknown Response Type');
    }
  }
}
