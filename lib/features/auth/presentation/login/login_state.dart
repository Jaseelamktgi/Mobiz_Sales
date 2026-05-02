part of 'login_cubit.dart';

@immutable
class LoginState {
  final bool isHidden;
  final bool isLoading;
  final bool isSuccess;
  final String? error;

  const LoginState({
    this.isHidden = true,
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
  });

  LoginState copyWith({
    bool? isHidden,
    bool? isLoading,
    bool? isSuccess,
    String? error,
  }) {
    return LoginState(
      isHidden: isHidden ?? this.isHidden,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error,
    );
  }
}
