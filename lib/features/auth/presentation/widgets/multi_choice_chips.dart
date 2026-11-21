import 'package:kira/core/utilities/App_colors.dart';
import 'package:kira/core/utilities/app_text_style.dart';
import 'package:material_ui/material_ui.dart';

class MultiChoiceChips extends StatefulWidget {
  const MultiChoiceChips({super.key, required this.options});

  final List<String> options;

  @override
  State<MultiChoiceChips> createState() => _MultiChoiceChipsState();
}

class _MultiChoiceChipsState extends State<MultiChoiceChips> {
  final String otherLabel = 'أخرى';
  late final List<bool> selectedList;
  @override
  void initState() {
    selectedList = List.filled(widget.options.length, false);
    super.initState();
  }

  void _toggleOption(int index) {
    if (selectedList[index]) {
      setState(() {
        selectedList[index] = false;
      });
    } else {
      setState(() {
        selectedList[index] = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(
        widget.options.length,
        (index) => ChoiceChip(
          label: Text(widget.options[index], style: AppTextStyle.medium14),
          selected: selectedList[index],
          showCheckmark: false,
          onSelected: (_) => _toggleOption(index),
          backgroundColor: AppColors.white,
          selectedColor: AppColors.primary,
          side: BorderSide(
            color: selectedList[index] ? AppColors.primary : AppColors.line,
            width: 1,
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          labelStyle: AppTextStyle.regular14.copyWith(
            color: selectedList[index] ? AppColors.white : AppColors.black,
          ),
        ),
      ),
    );
  }
}
