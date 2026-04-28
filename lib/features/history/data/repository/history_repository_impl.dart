import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/core/services/request_service.dart';
import 'package:zupa/features/history/data/api/history_api.dart';
import 'package:zupa/features/history/data/models/filter/history_filter_model.dart';
import 'package:zupa/features/history/data/models/history_ticket_model.dart';
import 'package:zupa/features/history/domain/usecases/params/get_history_params.dart';
import 'package:zupa/features/history/domain/entities/history_ticket_entity.dart';
import 'package:zupa/features/history/domain/repository/history_repository.dart';

@LazySingleton(as: IHistoryRepository)
class HistoryRepositoryImpl implements IHistoryRepository {
  final HistoryAPI _api;
  final RequestService _networkService;

  HistoryRepositoryImpl(this._networkService, this._api);

  @override
  Future<RequestState<List<HistoryTicketEntity>>> getHistory({
    required GetHistoryParams filter,
    RequestToken? token,
  }) async {
    final response = await _networkService.request(
      request: (cancelToken) => _api.getList(payload: HistoryFilterModel.fromEntity(filter), cancelToken: cancelToken),
      token: token,
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
