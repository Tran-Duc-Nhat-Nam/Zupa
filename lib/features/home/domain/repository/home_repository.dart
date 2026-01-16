import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/home/data/models/ticket.dart';

abstract class IHomeRepository {
  Future<NetworkState<List<HomeTicket>>> getTickets({
    int page = 1,
    int pageSize = 10,
    // Add filter parameters if needed, or a specific filter object
  });
}
