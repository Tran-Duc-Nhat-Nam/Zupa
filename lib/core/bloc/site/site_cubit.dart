import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/models/form/site/site_form.dart';

part 'site_state.dart';
part 'site_cubit.freezed.dart';

@injectable
class SiteCubit extends Cubit<SiteState> {
  SiteCubit() : super(const .initial());

  final form = SiteForm(SiteForm.formElements(Site(code: '')), null, null);

  void init() {
    emit(const .loaded());
  }
}
