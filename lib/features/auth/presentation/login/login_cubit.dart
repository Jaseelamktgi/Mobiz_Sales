import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobizsales/core/navigators/page_navigator.dart';
import 'package:mobizsales/core/utils/auth.dart';
import 'package:mobizsales/features/auth/data/models/login_model.dart';
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
    print("Login called");
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
        final userId = resp.user?.id.toString() ?? "";

        await Auth.saveUserData(
          userId: userId,
          storeId: resp.user?.storeId.toString() ?? "112",
        );

        safeEmit(state.copyWith(isSuccess: true));
        openAsNewPage(DashboardScreen());
      } else {
        safeEmit(state.copyWith(error: "Invalid credentials"));
      }
    } else {
      safeEmit(state.copyWith(error: "Something went wrong"));
    }
  }
}
