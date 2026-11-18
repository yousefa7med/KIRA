import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kira/core/config/configrations.dart';
import 'package:kira/core/navigations/navigations.dart';
import 'package:kira/core/utilities/App_colors.dart';
import 'package:kira/core/utilities/app_text_style.dart';
import 'package:kira/core/utilities/assets.dart';
import 'package:kira/core/widgets/app_buttons.dart';
import 'package:kira/core/widgets/app_text_form_field.dart';
import 'package:kira/features/auth/controller/cubit/auth_cubit.dart';
import 'package:kira/features/auth/presentation/widgets/signup_page_indicator.dart';

class SignupStepOneView extends StatefulWidget {
  const SignupStepOneView({super.key});

  @override
  State<SignupStepOneView> createState() => _SignupStepOneViewState();
}

class _SignupStepOneViewState extends State<SignupStepOneView> {
  late final TextEditingController userNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final GlobalKey<FormState> formKey;
  @override
  void initState() {
    final user = context.read<AuthCubit>().user;
    userNameController = TextEditingController(text: user.username);
    emailController = TextEditingController(text: user.email);
    passwordController = TextEditingController(text: user.password);
    confirmPasswordController = TextEditingController(text: user.password);
    formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, rains) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: rains.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(8),
                          const SignupPageIndicator(stage: 1),
                          const Gap(24),
                          IconButton(
                            onPressed: () {
                              AppNavigation.pop(context);
                            },
                            icon: SvgPicture.asset(
                              Assets.iconsArrowBack,
                              height: 28,
                            ),
                          ),
                          const Gap(12),
                          const Text(
                            "ابدأ بفهم شغلك اليوم",
                            style: AppTextStyle.bold28,
                          ),
                          const Gap(6),
                          const Text(
                            "أنشئ حسابك وارفع أول ملف، وسنجهّز لك تحليلاً بلغة بسيطة.",
                            style: AppTextStyle.regular16,
                          ),
                          const Gap(30),
                          Text(
                            "اسم المستخدم",
                            style: AppTextStyle.semiBold20.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          const Gap(4),
                          AppTextFormField(
                            label: "اسم المستخدم",
                            controller: userNameController,
                          ),
                          const Gap(6),
                          Text(
                            "البريد الالكتروني",
                            style: AppTextStyle.semiBold20.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          const Gap(4),
                          AppTextFormField(
                            label: "البريد الالكتروني",
                            controller: emailController,
                          ),
                          const Gap(6),
                          Text(
                            "كلمة المرور",
                            style: AppTextStyle.semiBold20.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          const Gap(4),
                          AppTextFormField(
                            label: "كلمة المرور",
                            controller: passwordController,
                            isPasswordField: true,
                          ),
                          const Gap(6),
                          Text(
                            "تأكيد كلمة المرور",
                            style: AppTextStyle.semiBold20.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                          const Gap(4),
                          AppTextFormField(
                            label: "تأكيد كلمة المرور ",
                            controller: confirmPasswordController,
                            isPasswordField: true,
                          ),
                          const Gap(56),
                        ],
                      ),
                      Column(
                        children: [
                          AppButtons(
                            child: const Text(
                              "التالي",
                              style: AppTextStyle.semiBold18,
                            ),
                            onPressed: () {
                              context.read<AuthCubit>().user = context
                                  .read<AuthCubit>()
                                  .user
                                  .copyWith(
                                    username: userNameController.text,
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                              AppNavigation.pushName(
                                context: context,
                                route: AppRoutes.signupStep2,
                              );
                            },
                          ),
                          const Gap(100),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
