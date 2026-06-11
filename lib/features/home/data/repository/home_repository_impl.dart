import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_response.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/core/services/request_service.dart';
import 'package:zupa/features/home/data/api/home_api.dart';
import 'package:zupa/features/home/domain/usecases/params/get_ticket_params.dart';
import 'package:zupa/features/home/domain/entities/home_ticker_entity.dart';
import 'package:zupa/features/home/domain/repository/home_repository.dart';

@LazySingleton(as: IHomeRepository)
class HomeRepositoryImpl with RequestService implements IHomeRepository {
  final HomeAPI _api;

  HomeRepositoryImpl(this._api);

  @override
  Future<RequestState<List<HomeTicketEntity>>> getTickets({
    required GetTicketParams filter,
    RequestToken? token,
  }) async {
    final response = await request(
      request: (cancelToken) =>
          _api.getList(payload: .fromEntity(filter), cancelToken: cancelToken),
      token: token,
    );

    return response.when(
      success: (data) => Success(data.data.map((e) => e.toEntity()).toList()),
      failure: (error) => Error(error.errorMessage),
      cancelled: () => const Error('cancelled'),
    );
  }
}
