import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/site/domain/entities/site_entity.dart';
import 'package:zupa/features/site/domain/repository/site_repository.dart';
import 'package:zupa/features/site/domain/usecases/get/params/get_site_list_params.dart';

@injectable
class GetSiteListUseCase {
  final ISiteRepository _repository;

  GetSiteListUseCase(this._repository);

  Future<RequestState<List<SiteEntity>>> call({
    required GetSiteListParams params,
    RequestToken? token,
  }) async {
    return _repository.getSiteList(params: params, token: token);
  }
}
