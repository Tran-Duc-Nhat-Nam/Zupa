import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/home/domain/entities/home_ticker_entity.dart';
import 'package:zupa/features/home/domain/repository/home_repository.dart';
import 'package:zupa/features/home/domain/usecases/params/get_ticket_params.dart';

@injectable
class GetTicketUseCase {
  final IHomeRepository _repository;

  GetTicketUseCase(this._repository);

  Future<RequestState<List<HomeTicketEntity>>> call({
    required GetTicketParams filter,
    RequestToken? token,
  }) async {
    return _repository.getTickets(filter: filter, token: token);
  }
}
