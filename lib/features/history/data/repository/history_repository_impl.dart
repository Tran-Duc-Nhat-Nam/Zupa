import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_response.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/core/services/request_service.dart';
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

    return response.maybeWhen(
      success: (data) => .success(data.data.map((e) => e.toEntity()).toList()),
      failure: (error) => .error(error.errorMessage),
      cancelled: () => const .error('cancelled'),
      orElse: () => const .error('unknown_response'),
    );
  }
}
