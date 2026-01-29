import 'package:injectable/injectable.dart';
import 'package:dio/dio.dart';
import 'package:zupa/core/resource/network_state.dart';
import 'package:zupa/core/services/network_service.dart';
import 'package:zupa/core/data/response/success/success_response.dart';
import 'package:zupa/core/data/response/error/error_response.dart';
import 'package:zupa/features/home/domain/repository/home_repository.dart';
import 'package:zupa/features/home/data/api/home_api.dart';
import 'package:zupa/features/home/data/models/ticket.dart';
import 'package:zupa/features/home/domain/entities/home_filter.dart';

@LazySingleton(as: IHomeRepository)
class HomeRepositoryImpl implements IHomeRepository {
  final HomeAPI _api;
  final NetworkService _networkService;

  HomeRepositoryImpl(this._networkService, Dio dio) : _api = HomeAPI(dio);

  @override
  Future<NetworkState<List<HomeTicket>>> getTickets({
    int page = 0 ,
    int pageSize = 10,
    HomeFilter? filter,
  }) async {
    final response = await _networkService.request(
      (dio) => _api.getList(
        .new(page: page, size: pageSize, query: filter?.toJson()),
      ),
    );

    if (response is SuccessResponse) {
      try {
        final List<dynamic> dataList = response.data.data as List<dynamic>;
        final tickets = dataList
            .map((e) => HomeTicket.fromJson(e as Map<String, dynamic>))
            .toList();
        return .success(tickets);
      } catch (e) {
        return .error('Parsing Error: ${e.toString()}');
      }
    } else if (response is ErrorResponse) {
      if (response.code == 4001) {
        return const .unauthenticated();
      } else {
        return .error(response.message);
      }
    } else {
      return const .error('Unknown Response Type');
    }
  }
}
