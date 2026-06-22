import 'package:injectable/injectable.dart';
import 'package:zupa/core/data/models/request/request_response.dart';
import 'package:zupa/core/data/models/request/request_state.dart';
import 'package:zupa/core/data/models/request/request_token.dart';
import 'package:zupa/core/helper/services/request_service.dart';
import 'package:zupa/features/history/data/api/history_api.dart';
import 'package:zupa/features/history/domain/usecases/params/get_history_params.dart';
import 'package:zupa/features/history/domain/entities/history_ticket_entity.dart';
import 'package:zupa/features/history/domain/repository/history_repository.dart';

@LazySingleton(as: IHistoryRepository)
class HistoryRepositoryImpl with RequestService implements IHistoryRepository {
  final HistoryAPI _api;

  HistoryRepositoryImpl(this._api);

  @override
  Future<RequestState<List<HistoryTicketEntity>>> getHistory({
    required GetHistoryParams filter,
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
      cancelled: () => const Error(code: 0, message: 'cancelled'),
    );
  }
}
