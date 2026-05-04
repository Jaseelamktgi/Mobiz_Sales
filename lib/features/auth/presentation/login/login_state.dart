part of 'login_cubit.dart';

@immutable
class LoginState {
  final bool isHidden;
  final bool isLoading;
  final bool isSuccess;
  final String? error;
  final UserDetailData? userData;

  const LoginState({
    this.isHidden = true,
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
    this.userData,
  });

  LoginState copyWith({
    bool? isHidden,
    bool? isLoading,
    bool? isSuccess,
    String? error,
    UserDetailData? userData,
  }) {
    return LoginState(
      isHidden: isHidden ?? this.isHidden,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error,
      userData: userData ?? this.userData,
    );
  }
}
