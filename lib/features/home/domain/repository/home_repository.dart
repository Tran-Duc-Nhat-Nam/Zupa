import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/home/domain/usecases/params/get_ticket_params.dart';
import 'package:zupa/features/home/domain/entities/home_ticker_entity.dart';

abstract class IHomeRepository {
  Future<NetworkState<List<HomeTicketEntity>>> getTickets({
    int page,
    int pageSize,
    GetTicketParams filter,
  });
}
