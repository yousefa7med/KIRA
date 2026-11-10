import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kira/core/utilities/App_colors.dart';
import 'package:kira/core/utilities/app_text_style.dart';
import 'package:kira/core/utilities/assets.dart';
import 'package:kira/core/widgets/app_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.logoKiraSymbol, height: 166),
                    const Text("KIRA", style: AppTextStyle.bold46),
                    const Gap(26),
                    const Text(
                      "نجاحك القادم يبدأ برؤية أوضح.",
                      style: AppTextStyle.semiBold20,
                    ),
                    const Gap(34),
                    Align(
                      alignment: AlignmentGeometry.centerRight,
                      child: Text(
                        "البريد الالكتروني",
                        style: AppTextStyle.semiBold20.copyWith(
                          color: AppColors.primary,
                          // fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const Gap(8),
                    const AppTextFormField(label: "البريد الالكتروني"),
                    const Gap(6),
                    Align(
                      alignment: AlignmentGeometry.centerRight,
                      child: Text(
                        "كلمة المرور",
                        style: AppTextStyle.semiBold20.copyWith(
                          color: AppColors.primary,
                          // fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const Gap(8),
                    const AppTextFormField(label: "كلمة المرور"),
                    const Gap(2),

                    const Align(
                      alignment: AlignmentGeometry.centerRight,
                      child: Text(
                        "هل نسيت كلمة المرور؟",
                        style: AppTextStyle.semiBold12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
