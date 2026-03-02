import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/core/data/models/ticket/ticket.dart';
import 'package:zupa/features/home/domain/entities/home_filter.dart';

abstract class IHomeRepository {
  Future<NetworkState<List<Ticket>>> getTickets({
    int page = 0,
    int pageSize = 10,
    HomeFilter? filter,
  });
}
