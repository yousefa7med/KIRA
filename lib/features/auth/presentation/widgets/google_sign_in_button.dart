import 'package:flutter/material.dart';
import 'package:kira/core/utilities/app_text_style.dart';
import 'package:kira/core/utilities/assets.dart';

class GoogleSignInButton extends StatelessWidget {
  const GoogleSignInButton({super.key, this.isLoading = false, this.onPressed});
  final bool isLoading;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const Text(
                "جار تسجيل الدخول ....",
                style: AppTextStyle.semiBold18,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("تسجيل باستخدام ", style: AppTextStyle.semiBold18),
                  Image.asset(Assets.logoGoogleIMG, height: 30),
                ],
              ),
      ),
    );
  }
}
