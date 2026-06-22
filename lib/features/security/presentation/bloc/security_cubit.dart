import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/helper/services/security_service.dart';

part 'security_cubit.freezed.dart';
part 'security_state.dart';

@injectable
class SecurityCubit extends Cubit<SecurityState> {
  SecurityCubit(this._securityService) : super(const .initial());

  final SecurityService _securityService;

  Future<void> checkSecurity() async {
    final result = await _securityService.isSecurityVulnerable;
    emit(switch (result) {
      SafeSecurityResult(:final note) => .safe(reason: note),
      VulnerableSecurityResult(:final reason) => .vulnerable(reason: reason),
    });
  }
}
