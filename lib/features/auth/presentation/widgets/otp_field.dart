import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:kira/core/utilities/App_colors.dart';
import 'package:kira/core/utilities/app_text_style.dart';
import 'package:material_ui/material_ui.dart';

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
    this.onChanged,
    this.onCompleted,
    this.error = false,
    this.success = false,
    this.enabled = true,
  });

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onCompleted;
  final bool error;
  final bool success;
  final bool enabled;

  Color get stateColor {
    if (error) return AppColors.error;
    if (success) return AppColors.primary;
    return AppColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    return OtpTextField(
      numberOfFields: 6,
      fieldWidth: 42,
      fieldHeight: 56,
      borderRadius: BorderRadius.circular(8),
      borderWidth: 1.5,
      contentPadding: const EdgeInsets.symmetric(vertical: 12),
      showFieldAsBox: true,
      filled: true,
      fillColor: AppColors.white,

      enabled: enabled,

      borderColor: error || success ? stateColor : AppColors.line,

      enabledBorderColor: error || success ? stateColor : AppColors.line,

      focusedBorderColor: stateColor,

      disabledBorderColor: AppColors.lightGrey,

      cursorColor: AppColors.primary,
      keyboardType: TextInputType.number,
      autoFocus: false,

      textStyle: AppTextStyle.regular24,
      onCodeChanged: onChanged,
      onSubmit: onCompleted,
    );
  }
}
