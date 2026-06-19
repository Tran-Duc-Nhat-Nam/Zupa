import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/bloc/security/security_state.dart';
import 'package:zupa/core/services/security_service.dart';

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
