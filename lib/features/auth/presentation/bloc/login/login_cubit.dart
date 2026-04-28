import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:zupa/core/resource/request_state.dart';
import 'package:zupa/core/resource/request_token.dart';
import 'package:zupa/core/services/storage_service.dart';
import 'package:zupa/features/auth/domain/usecases/login_usecase.dart';
import 'package:zupa/features/auth/domain/usecases/params/login_params.dart';
import 'package:zupa/features/auth/presentation/bloc/auth/auth_cubit.dart';

part 'login_cubit.freezed.dart';
part 'login_state.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _login;
  final StorageService _storageService;
  final AuthCubit _authCubit;
  RequestToken? _loginToken;

  LoginCubit(this._storageService, this._login, this._authCubit)
    : super(const .initial());
  Future<void> init() async {
    final accountInfo = await _storageService.getAccountInfo();
    final bool isSavedRemember =
        accountInfo.tenant.isNotEmpty &&
        accountInfo.username.isNotEmpty &&
        accountInfo.password.isNotEmpty;
    emit(
      isSavedRemember
          ? .loaded(
              tenant: accountInfo.tenant,
              username: accountInfo.username,
              password: accountInfo.password,
              isRemember: isSavedRemember,
            )
          : const .loaded(),
    );
  }

  Future<void> load({
    String? tenant,
    String? username,
    bool? isRemember,
  }) async {
    if (tenant != null || username != null) {
      emit(.loaded(tenant: tenant, username: username, isRemember: isRemember));
    }
  }

  Future<void> login({required LoginParams params}) async {
    try {
      emit(const .submitting());
      _loginToken?.cancel();
      _loginToken = .new();
      final result = await _login(params: params, token: _loginToken);
      result.maybeWhen(
        success: (data) async {
          await _storageService.setAuth(data.accessToken);
          await _storageService.setUser(data.user);

          if (params.isRemember == true) {
            await _storageService.saveAccountInfo(
              params.tenant,
              params.username,
              params.password,
            );
          } else {
            await _storageService.removeAccountInfo();
          }
          await _authCubit.loadAuth();
          emit(const .loginSuccess());
        },
        error: (message) {
          emit(.loginFailed(message));
        },
        orElse: () {
          emit(const .loginFailed('error'));
        },
      );
    } catch (e) {
      emit(.loginFailed(e.toString()));
    }
  }

  @override
  Future<void> close() {
    _loginToken?.cancel();
    return super.close();
  }
}
