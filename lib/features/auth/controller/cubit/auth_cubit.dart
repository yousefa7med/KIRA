import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kira/features/auth/data/models/signup_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<bool> login(String email, String password) async {
    emit(state.copyWith(activeAction: AuthAction.login));
    await Future.delayed(const Duration(seconds: 2), () {});
    emit(state.copyWith(activeAction: AuthAction.idle));

    return true;
  }

  bool signup(SignUpModel user) {
    emit(state.copyWith(activeAction: AuthAction.signup));

    Future.delayed(const Duration(seconds: 2), () {});
    emit(state.copyWith(activeAction: AuthAction.idle));

    return true;
  }

  Future<bool> signinWithGoogle() async {
    emit(state.copyWith(activeAction: AuthAction.googleLogin));

  await  Future.delayed(const Duration(seconds: 2), () {});
    emit(state.copyWith(activeAction: AuthAction.idle));

    return true;
  }
}
