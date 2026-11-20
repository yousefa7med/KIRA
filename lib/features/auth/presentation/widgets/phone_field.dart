import 'package:material_ui/material_ui.dart';
import 'package:phone_form_field/phone_form_field.dart';

class KiraPhoneField extends StatefulWidget {
  const KiraPhoneField({
    super.key,
    this.controller,
    this.onChanged,
    this.validator,
    this.enabled = true,
  });

  final PhoneController? controller;
  final ValueChanged<PhoneNumber?>? onChanged;
  final PhoneNumberInputValidator? validator;
  final bool enabled;

  @override
  State<KiraPhoneField> createState() => _KiraPhoneFieldState();
}

class _KiraPhoneFieldState extends State<KiraPhoneField> {
  late final PhoneController _controller;
  late final bool _ownsController;

  static const Color _primary = Color(0xFF0B5C6B);
  static const Color _border = Color(0xFFDDD2BF);
  static const Color _background = Color(0xFFFAFEFF);
  static const Color _error = Color(0xFFB4232C);
  static const Color _text = Color(0xFF021417);
  static const Color _hint = Color(0xFFCACDCE);

  @override
  void initState() {
    super.initState();

    _ownsController = widget.controller == null;

    _controller =
        widget.controller ??
        PhoneController(
          initialValue: const PhoneNumber(isoCode: IsoCode.EG, nsn: ''),
        );
  }

  @override
  void dispose() {
    if (_ownsController) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PhoneFormField(
        controller: _controller,
        enabled: widget.enabled,

        countrySelectorNavigator:
            const CountrySelectorNavigator.draggableBottomSheet(),

        isCountrySelectionEnabled: true,
        isCountryButtonPersistent: true,

        countryButtonStyle: const CountryButtonStyle(
          showFlag: true,
          showDialCode: true,
          showIsoCode: false,
          flagSize: 18,
        ),

        validator:
            widget.validator ??
            PhoneValidator.compose([
              PhoneValidator.required(context, errorText: 'رقم الهاتف مطلوب'),
              PhoneValidator.validMobile(
                context,
                errorText: 'رقم الهاتف غير صحيح',
              ),
            ]),

        onChanged: widget.onChanged,

        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: _text,
          fontFamily: 'Noto Sans',
        ),

        decoration: InputDecoration(
          hintTextDirection: TextDirection.rtl,

          hintText: 'رقم الهاتف',
          hintStyle: const TextStyle(
            color: _hint,
            fontSize: 16,
            fontWeight: FontWeight.w400,
            fontFamily: 'Noto Sans',
          ),

          filled: true,
          fillColor: _background,

          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: _border, width: 1.5),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: _border, width: 1.5),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: _primary, width: 2.5),
          ),

          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: _error, width: 2.5),
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: _error, width: 2.5),
          ),
        ),
      ),
    );
  }
}
