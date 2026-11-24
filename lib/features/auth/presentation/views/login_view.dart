import 'package:kira/core/utilities/validators.dart';
import 'package:kira/features/auth/data/models/signup_model.dart';
import 'package:material_ui/material_ui.dart';
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
import 'package:kira/features/auth/presentation/widgets/google_sign_in_button.dart';
import 'package:kira/features/auth/presentation/widgets/login_divider.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final GlobalKey<FormState> formKey;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constrains) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),

                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constrains.maxHeight),
                  child: BlocConsumer<AuthCubit, AuthState>(
                    listenWhen: (previous, current) => current is AuthFailure,

                    listener: (context, state) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text((state as AuthFailure).message)),
                      );
                    },
                    builder: (context, state) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Gap(36),
                                  SvgPicture.asset(
                                    Assets.logoKiraSymbol,
                                    height: 166,
                                  ),
                                  const Text(
                                    "KIRA",
                                    style: AppTextStyle.bold46,
                                  ),
                                  const Gap(24),
                                  const Text(
                                    "نجاحك القادم يبدأ برؤية أوضح.",
                                    style: AppTextStyle.semiBold20,
                                  ),
                                  const Gap(24),
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
                                  const Gap(4),
                                  AppTextFormField(
                                    label: "البريد الالكتروني",
                                    controller: emailController,
                                    validator: Validator.emailValidator(),
                                    enabled: !state.isBusy,
                                  ),
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
                                  const Gap(4),
                                  AppTextFormField(
                                    label: "كلمة المرور",
                                    enabled: !state.isBusy,
                                    isPasswordField: true,
                                    controller: passwordController,
                                    validator:
                                        Validator.loginPasswordValidator(),
                                  ),
                                  const Gap(4),

                                  Align(
                                    alignment: AlignmentGeometry.centerRight,
                                    child: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        AppNavigation.pushName(
                                          context: context,
                                          route: AppRoutes.changePassword,
                                        );
                                      },
                                      child: Text(
                                        "هل نسيت كلمة المرور؟",
                                        style: AppTextStyle.semiBold12.copyWith(
                                          color: AppColors.primary,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(28),

                                  AppButtons(
                                    isLoading: state.isLoading(
                                      AuthAction.login,
                                    ),
                                    onPressed: state.isBusy
                                        ? null
                                        : () async {
                                            if (formKey.currentState!
                                                .validate()) {
                                              final isSeccess = await context
                                                  .read<AuthCubit>()
                                                  .login(
                                                    emailController.text,
                                                    passwordController.text,
                                                  );
                                              isSeccess
                                                  ? {
                                                      FocusScope.of(
                                                        context,
                                                      ).unfocus(),

                                                      AppNavigation.pushName(
                                                        context: context,
                                                        route: AppRoutes
                                                            .signupStep1,
                                                      ),
                                                    }
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
                                      "تسجيل الدخول",
                                      style: AppTextStyle.semiBold18,
                                    ),
                                  ),

                                  const Gap(6),

                                  const LoginDivider(),
                                  const Gap(6),
                                  BlocBuilder<AuthCubit, AuthState>(
                                    builder: (context, state) {
                                      return GoogleSignInButton(
                                        onPressed: state.isBusy
                                            ? null
                                            : () async {
                                                final isSeccess = await context
                                                    .read<AuthCubit>()
                                                    .signinWithGoogle();
                                                isSeccess
                                                    ? {
                                                        context
                                                            .read<AuthCubit>()
                                                            .user = SignUpModel(
                                                          username: '',
                                                          email: '',
                                                          password: '',
                                                          phoneNumber: '',
                                                          birthDate: '',
                                                          interests: [],
                                                          industry: '',
                                                          businessDomain: '',
                                                          jobTitle: '',
                                                          companyName: '',
                                                        ),
                                                        FocusScope.of(
                                                          context,
                                                        ).unfocus(),

                                                        AppNavigation.pushName(
                                                          context: context,
                                                          route: AppRoutes
                                                              .signupStep2,
                                                        ),
                                                      }
                                                    : ScaffoldMessenger.of(
                                                        context,
                                                      ).showSnackBar(
                                                        const SnackBar(
                                                          content: Text("data"),
                                                        ),
                                                      );
                                              },
                                        isLoading: state.isLoading(
                                          AuthAction.googleLogin,
                                        ),
                                      );
                                    },
                                  ),
                                  const Gap(12),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'لا تمتلك حساب؟ ',
                                style: AppTextStyle.semiBold12.copyWith(
                                  color: AppColors.line,
                                ),
                              ),

                              GestureDetector(
                                onTap: () {
                                  context.read<AuthCubit>().user = SignUpModel(
                                    username: '',
                                    email: '',
                                    password: '',
                                    phoneNumber: '',
                                    birthDate: '',
                                    interests: [],
                                    industry: '',
                                    businessDomain: '',
                                    jobTitle: '',
                                    companyName: '',
                                  );
                                  FocusScope.of(context).unfocus();

                                  AppNavigation.pushName(
                                    context: context,
                                    route: AppRoutes.signupStep1,
                                  );
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'سجل الآن',
                                      style: AppTextStyle.bold12.copyWith(
                                        color: AppColors.primary,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    const Gap(16),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
