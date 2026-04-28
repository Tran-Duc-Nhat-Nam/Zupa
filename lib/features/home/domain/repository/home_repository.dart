import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/features/home/domain/usecases/params/get_ticket_params.dart';
import 'package:zupa/features/home/domain/entities/home_ticker_entity.dart';

abstract class IHomeRepository {
  Future<RequestState<List<HomeTicketEntity>>> getTickets({
    required GetTicketParams filter,
  });
}
