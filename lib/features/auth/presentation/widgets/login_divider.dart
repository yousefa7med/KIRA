import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kira/core/utilities/App_colors.dart';
import 'package:kira/core/utilities/app_text_style.dart';

class LoginDivider extends StatelessWidget {
  const LoginDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Divider(
            color: AppColors.line,
            thickness: 1.5,
            radius: BorderRadius.all(Radius.circular(32)),
          ),
        ),
        Gap(4),
        Text('أو', style: AppTextStyle.extraBold14),
        Gap(4),
        Expanded(
          child: Divider(
            color: AppColors.line,
            thickness: 1.5,
            radius: BorderRadius.all(Radius.circular(32)),
          ),
        ),
      ],
    );
  }
}
