import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobizsales/core/navigators/page_navigator.dart';
import 'package:mobizsales/core/utils/auth.dart';
import 'package:mobizsales/features/auth/data/models/user_details_model.dart';
import 'package:mobizsales/features/auth/data/repo/auth_repo.dart';
import 'package:mobizsales/features/dashboard/dashboard_screen.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginState());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void safeEmit(LoginState state) {
    if (!isClosed) emit(state);
  }

  void togglePassword() {
    safeEmit(state.copyWith(isHidden: !state.isHidden));
  }

  Future<void> login() async {
    debugPrint("Login called");

    final email = usernameController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      safeEmit(
        state.copyWith(isLoading: false, error: "All fields are required"),
      );
      return;
    }

    safeEmit(state.copyWith(isLoading: true, error: null));

    final resp = await AuthRepository.login(email: email, password: password);

    safeEmit(state.copyWith(isLoading: false));

    if (resp != null) {
      if (resp.status == "success") {
        await Auth.saveUserData(
          userId: resp.user?.id.toString() ?? "",
          storeId: resp.user?.storeId.toString() ?? "",
          name: resp.user?.name ?? "",
          email: resp.user?.email ?? "",
          roleId: resp.user?.rolId.toString() ?? "",
          token: resp.user?.token ?? "",
          routeId: "84",
          vanId: "0",
        );

        safeEmit(state.copyWith(isSuccess: true));

        openAsNewPage(DashboardScreen());
      } else {
        safeEmit(state.copyWith(error: resp.message ?? "Invalid credentials"));
      }
    } else {
      safeEmit(state.copyWith(error: "Something went wrong"));
    }
  }

  ///=======================[Get User Detail]=======================

  Future<void> getUserDetail() async {
    safeEmit(state.copyWith(isLoading: true, error: null));

    try {
      final response = await AuthRepository.getUserDetail(userId: Auth.userId);

      if (response != null && response.data!.isNotEmpty) {
        final user = response.data!.first;

        safeEmit(state.copyWith(isLoading: false, userData: user));
      } else {
        safeEmit(
          state.copyWith(isLoading: false, error: "No user detail found"),
        );
      }
    } catch (e) {
      debugPrint("USER DETAIL ERROR : $e");

      safeEmit(
        state.copyWith(isLoading: false, error: "Failed to load user detail"),
      );
    }
  }

  @override
  Future<void> close() {
    usernameController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
