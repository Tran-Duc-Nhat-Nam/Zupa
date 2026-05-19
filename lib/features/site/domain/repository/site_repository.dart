import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/site/domain/entities/site_entity.dart';
import 'package:zupa/features/site/domain/usecases/get/params/get_site_list_params.dart';

abstract class ISiteRepository {
  Future<RequestState<List<SiteEntity>>> getSiteList({
    required GetSiteListParams params,
    RequestToken? token,
  });
}
