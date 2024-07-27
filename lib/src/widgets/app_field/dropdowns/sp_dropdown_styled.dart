part of '../../widget.dart';

class SPDropDownStyled<T, R> extends StatelessWidget {
  final String name;
  final List<T> items;
  final String Function(T) getName;
  final R Function(T) getValue;
  final OnChanged<R>? onChanged;
  final Validator<Object>? validator;
  final String placeHolder;
  final String? label;
  final Widget? prefix;
  final R? initialValue;
  final dynamic Function(R?)? valueTransformer;
  final FocusNode? focusNode;
  final Color? backgroundColor;
  final ButtonStyleData? buttonStyleData;
  final IconStyleData iconStyleData;
  final DropdownStyleData? dropdownStyleData;
  final MenuItemStyleData? menuItemStyleData;
  final InputBorder? border;
  final InputDecoration? inputDecoration;

  final EdgeInsetsGeometry? contentPadding;
  final double? fontSizeLabel;
  final double? fontSizePlaceHolder;

  final double? maxHeight;

  const SPDropDownStyled({
    super.key,
    required this.name,
    required this.items,
    required this.getName,
    required this.getValue,
    this.onChanged,
    this.maxHeight,
    this.contentPadding,
    this.inputDecoration,
    this.validator,
    required this.placeHolder,
    this.label,
    this.prefix,
    this.initialValue,
    this.valueTransformer,
    this.focusNode,
    this.backgroundColor,
    this.buttonStyleData,
    this.iconStyleData = const IconStyleData(),
    this.dropdownStyleData,
    this.menuItemStyleData,
    this.border,
    this.fontSizeLabel,
    this.fontSizePlaceHolder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) _buildLabel(),
        _buildFormBuilderField(),
      ],
    );
  }

  Widget _buildLabel() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SPText(
        label!,
        fontSize: fontSizeLabel ?? 14.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildFormBuilderField() {
    return FormBuilderField<R>(
      name: name,
      validator: validator,
      initialValue: initialValue,
      valueTransformer: valueTransformer,
      focusNode: focusNode,
      builder: (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDropdownButtonFormField(state),
            if (state.hasError) _buildErrorText(state),
          ],
        );
      },
    );
  }

  Widget _buildDropdownButtonFormField(FormFieldState<R> state) {
    return DropdownButtonFormField2<R>(
      value: state.value,
      items: DropdownMenuItemGenerator<T, R>(
        items: items,
      ).generate(getName: getName, getValue: getValue),
      dropdownStyleData: dropdownStyleData ?? _defaultDropdownStyleData(),
      isExpanded: true,
      decoration: _buildInputDecoration(),
      iconStyleData: iconStyleData,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontFamily: 'Poppins',
      ),
      buttonStyleData: buttonStyleData,
      menuItemStyleData: menuItemStyleData ?? _defaultMenuItemStyleData(),
      hint: SPText(
        placeHolder,
        fontSize: fontSizePlaceHolder ?? 14,
        color: Colors.grey.withOpacity(0.4),
      ),
      onChanged: (value) {
        state.didChange(value);
        onChanged?.call(value);
      },
    );
  }

  DropdownStyleData _defaultDropdownStyleData() {
    return DropdownStyleData(
      maxHeight: maxHeight ?? 200,
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
      elevation: 0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(14)),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thickness: WidgetStateProperty.all(6),
        thumbVisibility: WidgetStateProperty.all(true),
      ),
    );
  }

  MenuItemStyleData _defaultMenuItemStyleData() {
    return MenuItemStyleData(
      padding: EdgeInsets.zero,
      customHeights: DropdownMenuItemGenerator<T, R>(items: items).calculateItemHeights,
    );
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      prefixIcon: prefix,
      fillColor: backgroundColor,
      labelStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
      ),
      hintStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
      ),
      filled: backgroundColor != null,
      contentPadding: contentPadding ?? const EdgeInsets.only(right: 10),
      border: border ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
    );
  }

  Widget _buildErrorText(FormFieldState<R> state) {
    return Column(
      children: [
        const SizedBox(height: 5),
        SPText(state.errorText ?? '', color: Colors.redAccent),
        const SizedBox(height: 3),
      ],
    );
  }
}
