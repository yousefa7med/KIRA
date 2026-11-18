import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kira/core/navigations/navigations.dart';
import 'package:kira/core/utilities/App_colors.dart';
import 'package:kira/core/utilities/app_text_style.dart';
import 'package:kira/core/utilities/assets.dart';
import 'package:kira/core/widgets/app_buttons.dart';
import 'package:kira/core/widgets/app_text_form_field.dart';
import 'package:kira/features/auth/controller/cubit/auth_cubit.dart';
import 'package:kira/features/auth/presentation/widgets/app_dropdown_menu.dart';
import 'package:kira/features/auth/presentation/widgets/signup_page_indicator.dart';

class SignupStepThreeView extends StatefulWidget {
  const SignupStepThreeView({super.key});

  @override
  State<SignupStepThreeView> createState() => _SignupStepThreeViewState();
}

class _SignupStepThreeViewState extends State<SignupStepThreeView> {
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
          builder: (context, constrains) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constrains.maxHeight),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Gap(8),
                            const SignupPageIndicator(stage: 3),
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
                              "خلّينا نتعرف عليك أكتر.",
                              style: AppTextStyle.bold28,
                            ),
                            const Gap(6),
                            const Text(
                              "معلومات بسيطة تساعدنا نقدم لك تحليلات تناسب طبيعة عملك.",
                              style: AppTextStyle.regular16,
                            ),
                            const Gap(30),
                            Text(
                              "مجال العمل",
                              style: AppTextStyle.semiBold20.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            const Gap(4),
                            AppDropDownMenu(
                              items: const ['يوسف', "جورج", "انور", "انيس"],
                              hintText: "مجال العمل (Industry)",
                            ),
                            const Gap(6),
                            Text(
                              "النشاط التجاري",
                              style: AppTextStyle.semiBold20.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            const Gap(4),
                            AppDropDownMenu(
                              items: const ['يوسف', "جورج", "انور", "انيس"],
                              hintText: "النشاط التجاري (Business Domain)",
                            ),
                            const Gap(6),
                            Text(
                              "المسمي الوظيفي",
                              style: AppTextStyle.semiBold20.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            const Gap(4),
                            AppTextFormField(
                              label: "المسمي الوظيفي",
                              controller: passwordController,
                            ),
                            const Gap(6),
                            Text(
                              "الشركة",
                              style: AppTextStyle.semiBold20.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            const Gap(4),
                            AppTextFormField(
                              label: "اسم الشركة",
                              controller: confirmPasswordController,
                            ),
                            const Gap(56),
                          ],
                        ),
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
