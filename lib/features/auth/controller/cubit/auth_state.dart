part of 'auth_cubit.dart';

enum AuthAction { idle, login, googleLogin, signup, requestOtp, changePassword }

sealed class AuthState {
  final AuthAction activeAction;

  AuthState({this.activeAction = AuthAction.idle});

  bool get isBusy => activeAction != AuthAction.idle;

  bool isLoading(AuthAction action) => activeAction == action;

  AuthState copyWith({AuthAction? activeAction}) {
    return AuthActionState(activeAction: activeAction ?? this.activeAction);
  }
}

final class AuthInitial extends AuthState {}

final class AuthActionState extends AuthState {
  AuthActionState({super.activeAction});
}

final class AuthFailure extends AuthState {
  final String message;
  AuthFailure({super.activeAction, required this.message});
}
