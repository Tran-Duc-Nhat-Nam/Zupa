import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/features/home/domain/entities/filter/home_filter_entity.dart';
import 'package:zupa/features/home/domain/entities/home_ticker_entity.dart';

abstract class IHomeRepository {
  Future<NetworkState<List<HomeTicketEntity>>> getTickets({
    int page,
    int pageSize,
    HomeFilterEntity filter,
  });
}
