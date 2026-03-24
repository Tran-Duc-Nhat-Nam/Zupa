import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/bloc/security/security_state.dart';
import 'package:zupa/core/services/security_service.dart';

@injectable
class SecurityCubit extends Cubit<SecurityState> {
  SecurityCubit(this._securityService) : super(const SecurityState.initial());

  final SecurityService _securityService;

  Future<void> checkSecurity() async {
    final bool isVulnerable = await _securityService.isSecurityVulnerable;
    if (isVulnerable) {
      emit(const SecurityState.vulnerable());
    } else {
      emit(const SecurityState.safe());
    }
  }
}
