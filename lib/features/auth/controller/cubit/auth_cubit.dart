import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kira/core/network/utils/result.dart';
import 'package:kira/features/auth/data/models/signup_model.dart';
import 'package:kira/features/auth/repository/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit({required this._authRepository}) : super(AuthInitial());
  late SignUpModel? user;
  Future<bool> login(String email, String password) async {
    emit(AuthActionState(activeAction: AuthAction.login));
    final result = await _authRepository.login(email, password);
    switch (result) {
      case Success():
        emit(AuthActionState(activeAction: AuthAction.idle));
        return true;
      case Error():
        emit(
          AuthFailure(
            activeAction: AuthAction.idle,
            message: result.failure.message,
          ),
        );
        return false;
    }
  }

  Future<bool> signup() async {
    emit(AuthActionState(activeAction: AuthAction.signup));
    final result = await _authRepository.signup(user!);
    switch (result) {
      case Success():
        emit(AuthActionState(activeAction: AuthAction.idle));
        return true;

      case Error():
        emit(
          AuthFailure(
            activeAction: AuthAction.idle,
            message: result.failure.message,
          ),
        );
        return false;
    }
  }

  Future<bool> changePassword(String newPassword) async {
    emit(state.copyWith(activeAction: AuthAction.changePassword));

    await Future.delayed(const Duration(seconds: 2), () {});
    emit(state.copyWith(activeAction: AuthAction.idle));

    return true;
  }

  Future<bool> signinWithGoogle() async {
    emit(state.copyWith(activeAction: AuthAction.googleLogin));

    await Future.delayed(const Duration(seconds: 2), () {});
    emit(state.copyWith(activeAction: AuthAction.idle));

    return true;
  }
}
