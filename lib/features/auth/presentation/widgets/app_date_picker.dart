import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kira/core/utilities/App_colors.dart';
import 'package:kira/core/utilities/app_text_style.dart';
import 'package:kira/core/utilities/assets.dart';
import 'package:kira/features/auth/controller/cubit/auth_cubit.dart';
import 'package:material_ui/material_ui.dart';

class AppDatePicker extends StatefulWidget {
  const AppDatePicker({super.key, required this.enabled});
  final bool enabled;
  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  DateTime? pickedDate;
  Future<void> _pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    setState(() {
      pickedDate = date;
    });
    context.read<AuthCubit>().user = context.read<AuthCubit>().user!.copyWith(
      birthDate: date.toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: widget.enabled ? () => _pickDate(context) : null,
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: widget.enabled
            ? AppColors.primary
            : AppColors.lightGrey,
        side: BorderSide(
          color: widget.enabled
              ? (pickedDate == null ? AppColors.line : AppColors.primary)
              : AppColors.lightGrey,
          width: pickedDate == null ? 1.5 : 2,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        minimumSize: const Size(double.infinity, 44),
      ),
      child: Row(
        children: [
          SvgPicture.asset(
            Assets.iconsCalender,
            height: 24,
            colorFilter: ColorFilter.mode(
              widget.enabled
                  ? (pickedDate == null ? AppColors.line : AppColors.primary)
                  : AppColors.lightGrey,
              BlendMode.srcIn,
            ),
          ),
          const Gap(8),
          Expanded(
            child: Text(
              pickedDate == null
                  ? 'يوم / شهر / سنة'
                  : '${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}',
              style: AppTextStyle.semiBold16.copyWith(
                color: widget.enabled
                    ? (pickedDate == null ? AppColors.line : AppColors.primary)
                    : AppColors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
