import 'package:kira/features/auth/presentation/widgets/app_date_picker.dart';
import 'package:kira/features/auth/presentation/widgets/multi_choice_chips.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:kira/core/config/configrations.dart';
import 'package:kira/core/navigations/navigations.dart';
import 'package:kira/core/utilities/App_colors.dart';
import 'package:kira/core/utilities/app_text_style.dart';
import 'package:kira/core/utilities/assets.dart';
import 'package:kira/core/widgets/app_buttons.dart';
import 'package:kira/features/auth/controller/cubit/auth_cubit.dart';
import 'package:kira/features/auth/presentation/widgets/phone_field.dart';
import 'package:kira/features/auth/presentation/widgets/signup_page_indicator.dart';

class SignupStepTwoView extends StatefulWidget {
  const SignupStepTwoView({super.key});

  @override
  State<SignupStepTwoView> createState() => _SignupStepTwoViewState();
}

class _SignupStepTwoViewState extends State<SignupStepTwoView> {
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),

      child: Scaffold(
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
                            const SignupPageIndicator(stage: 2),
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
                              "ساعدنا نفهم طبيعة عملك عشان نقدم لك تحليلات أكثر فائدة.",
                              style: AppTextStyle.regular16,
                            ),
                            const Gap(30),
                            Text(
                              "رقم الهاتف",
                              style: AppTextStyle.semiBold20.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            const Gap(4),
                            const KiraPhoneField(),
                            const Gap(20),
                            const AppDatePicker(),
                            const Gap(20),
                            const Text(
                              "إيه المجالات اللي بتهمك؟",
                              style: AppTextStyle.bold20,
                            ),
                            const Gap(8),

                            const MultiChoiceChips(
                              options: [
                                'التجارة والتجزئة',
                                'تجارة الجملة والتوزيع',
                                'التصنيع والصناعة',
                                'الأغذية والمشروبات',
                                'المطاعم والكافيهات',
                                // 'التجارة الإلكترونية',
                                // 'العقارات والإنشاءات',
                                // 'الرعاية الصحية',
                                // 'التعليم والتدريب',
                                // 'الخدمات المالية والمحاسبة',
                                // 'البنوك والتأمين',
                                // 'النقل والخدمات اللوجستية',
                                // 'السياحة والضيافة',
                                // 'الزراعة والإنتاج الحيواني',
                                // 'تكنولوجيا المعلومات والبرمجيات',
                                // 'التسويق والإعلان',
                                // 'الاستشارات وخدمات الأعمال',
                                // 'الطاقة والمرافق',
                                // 'الملابس والأزياء',
                                // 'السيارات وقطع الغيار',
                                // 'الأدوية والمستلزمات الطبية',
                                // 'الاتصالات',
                                // 'الخدمات المهنية',
                                // 'الخدمات الشخصية والمنزلية',
                                // 'الإعلام وصناعة المحتوى',
                                // 'الترفيه والرياضة',
                                // 'الاستيراد والتصدير',
                                // 'الموارد البشرية والتوظيف',
                                'أخرى',
                              ],
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
                                  route: AppRoutes.signupStep3,
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
      ),
    );
  }
}
