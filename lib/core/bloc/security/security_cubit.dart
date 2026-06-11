import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/bloc/security/security_state.dart';
import 'package:zupa/core/services/security_service.dart';

@injectable
class SecurityCubit extends Cubit<SecurityState> {
  SecurityCubit(this._securityService) : super(const .initial());

  final SecurityService _securityService;

  Future<void> checkSecurity() async => emit((await _securityService.isSecurityVulnerable) ? const .vulnerable() : const .safe());
}
