import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kira/core/utilities/App_colors.dart';

class SignupPageIndicator extends StatelessWidget {
  const SignupPageIndicator({super.key, required this.stage});
  final int stage;
  @override
  Widget build(BuildContext context) {
    int counter = stage + 1;
    return Row(
      children: List.generate(5, (index) {
        if (index % 2 == 0) {
          counter--;
          return Expanded(
            child: Divider(
              color: counter <= 0 ? AppColors.line : AppColors.primary,
              thickness: 5,
              radius: BorderRadius.circular(16),
            ),
          );
        } else {
          return const Gap(8);
        }
      }),
    );
  }
}
