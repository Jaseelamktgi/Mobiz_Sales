import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobizsales/core/extensions/margin_extn.dart';
import 'package:mobizsales/core/theme/colors.dart';
import 'package:mobizsales/core/widgets/app_custom_button.dart';
import 'package:mobizsales/core/widgets/app_text.dart';
import 'package:mobizsales/core/widgets/custom_field.dart';
import 'package:mobizsales/features/auth/presentation/login/login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => LoginCubit(),
      child: Scaffold(
        body: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              Container(
                height: 320,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(130),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 30, top: 70),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        "Mobiz",
                        size: 50,
                        weight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      AppText(
                        "Sales",
                        size: 40,
                        color: Colors.white,
                        height: .8,
                      ),
                    ],
                  ),
                ),
              ),

              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Transform.translate(
                    offset: const Offset(0, -40),
                    child: BlocBuilder<LoginCubit, LoginState>(
                      builder: (context, state) {
                        final cubit = context.read<LoginCubit>();

                        return Container(
                          padding: const EdgeInsets.all(22),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            boxShadow: const [
                              BoxShadow(
                                blurRadius: 8,
                                color: Colors.black12,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                "Login",
                                size: 30,
                                weight: FontWeight.w600,
                              ),
                              6.hBox,
                              AppText(
                                "Please sign in with your details",
                                size: 18,
                                color: Colors.black54,
                              ),
                              28.hBox,

                              customField(
                                controller: cubit.usernameController,
                                hint: "Username",
                                icon: Icons.person,
                              ),
                              20.hBox,
                              customField(
                                controller: cubit.passwordController,
                                hint: "Password",
                                icon: Icons.lock,
                                obscure: state.isHidden,
                                suffix: IconButton(
                                  icon: Icon(
                                    state.isHidden
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black54,
                                  ),
                                  onPressed: cubit.togglePassword,
                                ),
                              ),
                              10.hBox,
                              if (state.error != null) ...[
                                AppText(
                                  state.error!,
                                  color: Colors.red,
                                  size: 14,
                                ),
                              ],
                              30.hBox,

                              AppCustomButton(
                                btntext: "Log In",
                                bgColor: AppColors.primaryColor,
                                color: Colors.white,
                                radius: 18,
                                verticalPadding: 18,
                                textSize: 20,
                                isLoading: state.isLoading,
                                onTap: cubit.login,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
