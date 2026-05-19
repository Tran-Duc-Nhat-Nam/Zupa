import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/features/site/domain/entities/site_entity.dart';
import 'package:zupa/features/site/domain/usecases/get/get_site_list_usecases.dart';

part 'site_cubit.freezed.dart';
part 'site_state.dart';

@injectable
class SiteCubit extends Cubit<SiteState> {
  SiteCubit(this.getSiteList) : super(const .initial());

  final GetSiteListUseCase getSiteList;

  RequestToken? _getToken;

  Future<void> init() async {
    emit(const .loading());
    _getToken?.cancel();
    _getToken = .new();

    final result = await getSiteList(params: .initial(), token: _getToken);
    result.whenOrNull(
      success: (data) => emit(
        data.isEmpty
            ? const .empty()
            : .loaded(siteList: data, currentSite: data[0]),
      ),
      error: (message) => emit(.failed(message)),
    );
  }

  void changeSite(String code) {
    emit(const .loading());
    emit(const .loaded(siteList: []));
  }
}
