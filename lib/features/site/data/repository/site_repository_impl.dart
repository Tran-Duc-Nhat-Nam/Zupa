import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/site/data/api/site_api.dart';
import 'package:zupa/features/site/domain/entities/site_entity.dart';
import 'package:zupa/features/site/domain/repository/site_repository.dart';
import 'package:zupa/features/site/domain/usecases/get/params/get_site_list_params.dart';

@LazySingleton(as: ISiteRepository)
class SiteRepositoryImpl implements ISiteRepository {
  final SiteAPI _api;

  SiteRepositoryImpl(this._api);

  @override
  Future<RequestState<List<SiteEntity>>> getSiteList({
    required GetSiteListParams params,
    RequestToken? token,
  }) async {
    final sites = await _api.getSites();
    return Future.value(.success(sites.map((e) => e.toEntity()).toList()));
  }
}
