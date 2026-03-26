import 'package:injectable/injectable.dart';
import 'package:zupa/core/constants/query.dart';
import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/core/services/network_service.dart';
import 'package:zupa/features/history/data/api/history_api.dart';
import 'package:zupa/features/history/data/models/filter/history_filter_model.dart';
import 'package:zupa/features/history/data/models/history_ticket_model.dart';
import 'package:zupa/features/history/domain/entities/filter/history_filter_entity.dart';
import 'package:zupa/features/history/domain/entities/history_ticket_entity.dart';
import 'package:zupa/features/history/domain/repository/history_repository.dart';

@LazySingleton(as: IHistoryRepository)
class HistoryRepositoryImpl implements IHistoryRepository {
  final HistoryAPI _api;
  final NetworkService _networkService;

  HistoryRepositoryImpl(this._networkService, this._api);

  @override
  Future<NetworkState<List<HistoryTicketEntity>>> getHistory({
    int page = 1,
    int pageSize = 10,
    HistoryFilterEntity filter = const HistoryFilterEntity(
      page: defaultPageIndex,
      size: defaultPageSize,
      keyword: null,
      time: null,
      type: null,
    ),
  }) async {
    final response = await _networkService.request(
      (dio) => _api.getList(HistoryFilterModel.fromEntity(filter)),
    );

    if (response is SuccessResponse<List<HistoryTicketModel>>) {
      try {
        final items = response.data
            .map<HistoryTicketEntity>((e) => e.toEntity())
            .toList();
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
