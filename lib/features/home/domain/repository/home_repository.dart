import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/home/data/models/ticket.dart';
import 'package:zupa/features/home/domain/entities/home_filter.dart';

abstract class IHomeRepository {
  Future<NetworkState<List<HomeTicket>>> getTickets({
    int page = 1,
    int pageSize = 10,
    HomeFilter? filter,
  });
}
