import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:reactive_forms/reactive_forms.dart';

part 'site_state.dart';
part 'site_cubit.freezed.dart';

@injectable
class SiteCubit extends Cubit<SiteState> {
  SiteCubit() : super(const .initial());

  final FormGroup form = fb.group({
    'code': ['', Validators.required]
  });

  void init() {
    emit(const .loaded());
  }
}
