import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:kira/core/utilities/App_colors.dart';
import 'package:kira/core/utilities/app_text_style.dart';
import 'package:kira/core/utilities/assets.dart';
import 'package:material_ui/material_ui.dart';

class AppDatePicker extends StatefulWidget {
  const AppDatePicker({super.key});

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
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => _pickDate(context),
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.primary,
        side: BorderSide(
          color: AppColors.primary,
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
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
          const Gap(8),
          Expanded(
            child: Text(
              pickedDate == null
                  ? 'يوم / شهر / سنة'
                  : '${pickedDate!.day}/${pickedDate!.month}/${pickedDate!.year}',
              style: AppTextStyle.semiBold16,
            ),
          ),
        ],
      ),
    );
  }
}
