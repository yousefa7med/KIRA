import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kira/core/utilities/App_colors.dart';
import 'package:kira/core/utilities/app_text_style.dart';
import 'package:kira/core/utilities/assets.dart';

class AppDropDownMenu extends FormField<String> {
  final List<String> items;
  final String hintText;
  final String searchHint;
  final String emptyText;
  final ValueChanged<String?>? onChanged;
  final double maxMenuHeight;

  AppDropDownMenu({
    super.key,
    required this.items,
    this.hintText = 'اختر',
    this.searchHint = 'بحث...',
    this.emptyText = 'لا توجد نتائج',
    this.onChanged,
    this.maxMenuHeight = 220,
    super.initialValue,
    super.validator,
    super.enabled,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
  }) : super(
         builder: (field) {
           return _SearchableDropdownControl(
             items: items,
             value: field.value,
             hintText: hintText,
             searchHint: searchHint,
             emptyText: emptyText,
             errorText: field.errorText,
             enabled: enabled,
             maxMenuHeight: maxMenuHeight,
             onChanged: (value) {
               field.didChange(value);
               onChanged?.call(value);
             },
           );
         },
       );
}

class _SearchableDropdownControl extends StatefulWidget {
  final List<String> items;
  final String? value;
  final String hintText;
  final String searchHint;
  final String emptyText;
  final String? errorText;
  final bool enabled;
  final double maxMenuHeight;
  final ValueChanged<String?> onChanged;

  const _SearchableDropdownControl({
    required this.items,
    required this.value,
    required this.hintText,
    required this.searchHint,
    required this.emptyText,
    required this.errorText,
    required this.enabled,
    required this.maxMenuHeight,
    required this.onChanged,
  });

  @override
  State<_SearchableDropdownControl> createState() =>
      _SearchableDropdownControlState();
}

class _SearchableDropdownControlState
    extends State<_SearchableDropdownControl> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final LayerLink _layerLink = LayerLink();

  OverlayEntry? _overlayEntry;
  bool _isOpen = false;

  late List<(String, String)> _index;
  late List<String> _filtered;

  static final RegExp _diacritics = RegExp(r'[\u064B-\u065F\u0670\u0640]');
  static final RegExp _alef = RegExp('[أإآ]');

  static const Color _selectedColor = Color(0xFFE6F2F4);

  static const double _menuGap = 8;
  static const double _itemHeight = 42;

  @override
  void initState() {
    super.initState();
    _controller.text = widget.value ?? '';
    _buildIndex();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(covariant _SearchableDropdownControl oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.value != widget.value && !_isOpen) {
      _controller.text = widget.value ?? '';
    }

    if (oldWidget.enabled && !widget.enabled && _isOpen) {
      _closeDropdown();
    }

    if (!identical(oldWidget.items, widget.items)) {
      _buildIndex();
      _updateOverlay();
    }
  }

  String _normalize(String s) => s
      .replaceAll(_diacritics, '')
      .replaceAll(_alef, 'ا')
      .replaceAll('ى', 'ي')
      .replaceAll('ة', 'ه')
      .toLowerCase();

  void _buildIndex() {
    _index = [for (final item in widget.items) (item, _normalize(item))];
    _filtered = widget.items;
  }

  List<String> _filter(String query) {
    final q = _normalize(query.trim());
    if (q.isEmpty) return widget.items;
    return [
      for (final (original, normalized) in _index)
        if (normalized.contains(q)) original,
    ];
  }

  void _handleFocusChange() {
    if (mounted) setState(() {});
  }

  Color get _currentBorderColor {
    if (widget.errorText != null) return AppColors.error;
    if (_focusNode.hasFocus || _isOpen) return AppColors.primary;
    return AppColors.line;
  }

  double get _currentBorderWidth {
    if (widget.errorText != null || _focusNode.hasFocus || _isOpen) return 2.5;
    return 1.5;
  }

  void _openDropdown() {
    if (!widget.enabled || _isOpen) return;

    setState(() {
      _isOpen = true;
      _filtered = widget.items;
      _controller.clear();
    });

    _focusNode.requestFocus();

    _overlayEntry = OverlayEntry(
      builder: (overlayContext) => _buildOverlay(overlayContext),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  Widget _buildOverlay(BuildContext overlayContext) {
    if (!mounted) return const SizedBox.shrink();

    final renderObject = context.findRenderObject();
    if (renderObject is! RenderBox || !renderObject.hasSize) {
      return const SizedBox.shrink();
    }

    final overlayRenderObject = Overlay.of(context).context.findRenderObject();
    if (overlayRenderObject is! RenderBox || !overlayRenderObject.hasSize) {
      return const SizedBox.shrink();
    }

    final fieldSize = renderObject.size;
    final fieldTop = renderObject
        .localToGlobal(Offset.zero, ancestor: overlayRenderObject)
        .dy;
    final fieldBottom = fieldTop + fieldSize.height;

    final keyboard = MediaQuery.viewInsetsOf(overlayContext).bottom;
    final overlayHeight = overlayRenderObject.size.height;

    final availableBelow = overlayHeight - keyboard - fieldBottom - _menuGap;
    final availableAbove = fieldTop - _menuGap;

    final openAbove =
        availableBelow < widget.maxMenuHeight &&
        availableAbove > availableBelow;

    final maxH = math.max(
      0.0,
      math.min(
        widget.maxMenuHeight,
        openAbove ? availableAbove : availableBelow,
      ),
    );

    return Stack(
      children: [
        Positioned.fill(
          child: GestureDetector(
            onTap: _closeDropdown,

            behavior: HitTestBehavior.opaque,
            child: const SizedBox.expand(),
          ),
        ),
        CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,

          targetAnchor: openAbove ? Alignment.topLeft : Alignment.bottomLeft,
          followerAnchor: openAbove ? Alignment.bottomLeft : Alignment.topLeft,
          offset: Offset(0, openAbove ? -_menuGap : _menuGap),
          child: Material(
            color: Colors.transparent,
            child: SizedBox(
              width: fieldSize.width,
              child: _buildDropdownMenu(maxH),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownMenu(double maxHeight) {
    final filteredItems = _filtered;

    return Container(
      constraints: BoxConstraints(maxHeight: maxHeight),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.line, width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFF05282E),
            blurRadius: 13.80,
            offset: Offset(4, 4),
            spreadRadius: -8,
          ),
        ],
      ),

      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: filteredItems.isEmpty
            ? SizedBox(
                height: 56,
                child: Center(
                  child: Text(
                    widget.emptyText,
                    style: AppTextStyle.regular16.copyWith(
                      color: AppColors.darkGreen,
                    ),
                  ),
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 4),
                itemExtent: _itemHeight,
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final item = filteredItems[index];
                  final isLast = index == filteredItems.length - 1;
                  final isSelected = item == widget.value;

                  return InkWell(
                    onTap: () => _selectItem(item),
                    child: Container(
                      color: isSelected ? _selectedColor : null,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: isLast
                              ? null
                              : const Border(
                                  bottom: BorderSide(color: AppColors.line),
                                ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional.centerStart,
                          child: Text(
                            item,
                            textAlign: TextAlign.start,
                            style: AppTextStyle.regular16.copyWith(
                              color: AppColors.darkGreen,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  void _selectItem(String item) {
    widget.onChanged(item);
    _removeOverlay();

    setState(() {
      _isOpen = false;
      _controller.text = item;
    });

    _focusNode.unfocus();
  }

  void _closeDropdown() {
    if (!_isOpen) return;

    _removeOverlay();

    setState(() {
      _isOpen = false;
      _controller.text = widget.value ?? '';
    });

    _focusNode.unfocus();
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry?.dispose();
    _overlayEntry = null;
  }

  void _updateOverlay() {
    _overlayEntry?.markNeedsBuild();
  }

  OutlineInputBorder _border(Color color, double width) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: BorderSide(color: color, width: width),
  );

  @override
  void dispose() {
    _removeOverlay();
    _focusNode.removeListener(_handleFocusChange);
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = _border(_currentBorderColor, _currentBorderWidth);
    final errorBorder = _border(AppColors.error, 2.5);

    return PopScope(
      canPop: !_isOpen,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) _closeDropdown();
      },
      child: CompositedTransformTarget(
        link: _layerLink,
        child: TextField(
          controller: _controller,
          focusNode: _focusNode,
          readOnly: !_isOpen,
          enabled: widget.enabled,
          textAlign: TextAlign.start,
          onTap: _openDropdown,
          onChanged: (value) {
            setState(() => _filtered = _filter(value));
            _updateOverlay();
          },
          style: AppTextStyle.regular16.copyWith(color: AppColors.darkGreen),
          decoration: InputDecoration(
            hintText: _isOpen ? widget.searchHint : widget.hintText,
            hintStyle: AppTextStyle.regular16.copyWith(
              color: AppColors.lightGrey,
            ),
            filled: true,
            fillColor: AppColors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 10,
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: SvgPicture.asset(
                _isOpen ? Assets.iconsArrowUp : Assets.iconsArrowDown,
                colorFilter: const ColorFilter.mode(
                  AppColors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
            suffixIconConstraints: const BoxConstraints(
              minWidth: 24,
              minHeight: 24,
            ),
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
            errorText: widget.errorText,
          ),
        ),
      ),
    );
  }
}
