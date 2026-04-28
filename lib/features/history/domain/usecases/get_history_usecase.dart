import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/history/domain/entities/history_ticket_entity.dart';
import 'package:zupa/features/history/domain/repository/history_repository.dart';
import 'package:zupa/features/history/domain/usecases/params/get_history_params.dart';

@injectable
class GetHistoryUseCase {
  final IHistoryRepository _repository;

  GetHistoryUseCase(this._repository);

  Future<RequestState<List<HistoryTicketEntity>>> call({
    required GetHistoryParams filter,
    RequestToken? token,
  }) async {
    return _repository.getHistory(filter: filter, token: token);
  }
}
