import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kira/core/utilities/App_colors.dart';
import 'package:kira/core/utilities/app_text_style.dart';
import 'package:kira/core/utilities/assets.dart';

class AppTextFormField extends StatefulWidget {
  const AppTextFormField({
    super.key,
    this.controller,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.isPasswordField = false,
    this.onChange,
    required this.label,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool isPasswordField;
  final void Function(String)? onChange;
  final String label;
  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool obscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyle.regular12,
      controller: widget.controller,
      validator: widget.validator,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChange,
      obscureText: obscure,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 12,
        ),
        suffixIcon: widget.isPasswordField
            ? IconButton(
                onPressed: () {
                  setState(() {
                    obscure = !obscure;
                  });
                },
                icon: SvgPicture.asset(
                  obscure ? Assets.iconsEye : Assets.iconsEyeSlash,

                  height: 24,
                  colorFilter: const ColorFilter.mode(
                    AppColors.line,
                    BlendMode.srcIn,
                  ),
                ),
              )
            : null,
        filled: true,
        fillColor: AppColors.white,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColors.line, width: 1.5),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColors.error, width: 2),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        labelText: widget.label,
        labelStyle: AppTextStyle.regular16.copyWith(color: AppColors.lightGrey),
      ),
    );
  }
}
