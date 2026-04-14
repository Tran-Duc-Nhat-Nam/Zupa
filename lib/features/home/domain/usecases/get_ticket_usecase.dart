import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/home/domain/entities/home_ticker_entity.dart';
import 'package:zupa/features/home/domain/repository/home_repository.dart';
import 'package:zupa/features/home/domain/usecases/params/get_ticket_params.dart';

@injectable
class GetTicketUseCase {
  final IHomeRepository _repository;

  GetTicketUseCase(this._repository);

  Future<NetworkState<List<HomeTicketEntity>>> call({
    required GetTicketParams filter,
  }) async {
    return _repository.getTickets(filter: filter);
  }
}
