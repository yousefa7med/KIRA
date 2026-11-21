import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kira/core/config/configrations.dart';
import 'package:kira/core/navigations/navigations.dart';
import 'package:kira/core/utilities/App_colors.dart';
import 'package:kira/core/utilities/app_text_style.dart';
import 'package:kira/core/utilities/assets.dart';
import 'package:kira/core/widgets/app_buttons.dart';
import 'package:kira/core/widgets/app_text_form_field.dart';
import 'package:kira/features/auth/controller/cubit/auth_cubit.dart';
import 'package:material_ui/material_ui.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({super.key});

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  late final TextEditingController newPasswordController;
  late final TextEditingController confirmPasswordController;
  late final GlobalKey<FormState> formKey;
  @override
  void initState() {
    newPasswordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

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
        title: const Text("تغيير كلمة المرور", style: AppTextStyle.bold22),
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
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Gap(34),
                          SvgPicture.asset(
                            Assets.illustrationsPasswordIllustration,
                          ),
                          const Gap(42),

                          Align(
                            alignment: AlignmentGeometry.centerRight,
                            child: Text(
                              "كلمة المرور الجديدة",
                              style: AppTextStyle.semiBold20.copyWith(
                                color: AppColors.primary,
                                // fontSize: 18,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const Gap(4),
                          AppTextFormField(
                            label: "كلمة المرور الجديدة",
                            isPasswordField: true,
                            controller: newPasswordController,
                          ),
                          const Gap(6),
                          Align(
                            alignment: AlignmentGeometry.centerRight,
                            child: Text(
                              "تأكيد كلمة المرور",
                              style: AppTextStyle.semiBold20.copyWith(
                                color: AppColors.primary,
                                // fontSize: 18,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          const Gap(4),
                          AppTextFormField(
                            label: "تأكيد كلمة المرور",
                            isPasswordField: true,
                            controller: confirmPasswordController,
                          ),
                        ],
                      ),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          return AppButtons(
                            isLoading: state.isLoading(AuthAction.login),
                            onPressed: state.isBusy
                                ? null
                                : () async {
                                    if (formKey.currentState!.validate()) {
                                      final isSeccess = await context
                                          .read<AuthCubit>()
                                          .changePassword(
                                            newPasswordController.text,
                                          );
                                      isSeccess
                                          ? AppNavigation.pushName(
                                              context: context,
                                              route: AppRoutes.otp,
                                            )
                                          : ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              const SnackBar(
                                                content: Text("data"),
                                              ),
                                            );
                                    }
                                  },
                            child: const Text(
                              "تغيير كلمة المرور",
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
      ),
    );
  }
}
