import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kira/core/navigations/navigations.dart';
import 'package:kira/core/utilities/App_colors.dart';
import 'package:kira/core/utilities/app_text_style.dart';
import 'package:kira/core/utilities/assets.dart';
import 'package:kira/core/widgets/app_buttons.dart';
import 'package:kira/features/auth/controller/cubit/auth_cubit.dart';
import 'package:kira/features/auth/presentation/widgets/otp_field.dart';
import 'package:material_ui/material_ui.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            AppNavigation.pop(context);
          },
          icon: SvgPicture.asset(Assets.iconsArrowBack, height: 28),
        ),
        title: const Text("", style: AppTextStyle.bold22),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constrains) => SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constrains.maxHeight - 100,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const Gap(34),
                        SvgPicture.asset(Assets.illustrationsOTPIllustration),
                        const Gap(34),

                        const Text(
                          "لقد ارسلنا رمز تأكيدي الي بريدك يرجي التحقق من البريد ",
                          style: AppTextStyle.semiBold24,
                          textAlign: TextAlign.center,
                        ),
                        const Gap(4),
                        Text(
                          "Le****3@gmail.com",
                          style: AppTextStyle.regular16.copyWith(
                            color: AppColors.grey,
                          ),
                        ),
                        const Gap(34),
                        OtpField(
                          onChanged: (value) {
                            print(value);
                          },
                          onCompleted: (otp) {
                            log('Complete OTP: $otp');
                          },
                        ),
                        const Gap(48),
                      ],
                    ),
                    BlocBuilder<AuthCubit, AuthState>(
                      builder: (context, state) {
                        return AppButtons(
                          isLoading: state.isLoading(AuthAction.login),
                          onPressed: state.isBusy ? null : () {},
                          child: const Text(
                            "تأكيد",
                            style: AppTextStyle.semiBold18,
                          ),
                        );
                      },
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
