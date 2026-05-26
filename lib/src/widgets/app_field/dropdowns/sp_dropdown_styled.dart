part of '../../widget.dart';

class SPDropDownStyled<T, R> extends StatefulWidget {
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
    this.labelStyle,
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
  });

  final String name;
  final List<T> items;
  final String Function(T) getName;
  final R Function(T) getValue;
  final OnChanged<R>? onChanged;
  final Validator<R?>? validator;
  final String placeHolder;
  final String? label;
  final TextStyle? labelStyle;
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
  final double? maxHeight;

  @override
  State<SPDropDownStyled<T, R>> createState() => _SPDropDownStyledState<T, R>();
}

class _SPDropDownStyledState<T, R> extends State<SPDropDownStyled<T, R>> {
  late final ValueNotifier<R?> _valueNotifier;

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier<R?>(widget.initialValue);
  }

  @override
  void dispose() {
    _valueNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) _buildLabel(),
        _buildFormBuilderField(),
      ],
    );
  }

  Widget _buildLabel() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SPText(
        widget.label!,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)
            .merge(widget.labelStyle),
      ),
    );
  }

  Widget _buildFormBuilderField() {
    return FormBuilderField<R>(
      name: widget.name,
      validator: widget.validator,
      initialValue: widget.initialValue,
      valueTransformer: widget.valueTransformer,
      focusNode: widget.focusNode,
      builder: (state) {
        _valueNotifier.value = state.value;
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
      valueListenable: _valueNotifier,
      items: DropdownMenuItemGenerator<T, R>(items: widget.items)
          .generate(getName: widget.getName, getValue: widget.getValue),
      dropdownStyleData:
          widget.dropdownStyleData ?? _defaultDropdownStyleData(),
      isExpanded: true,
      decoration: _buildInputDecoration(),
      iconStyleData: widget.iconStyleData,
      style: const TextStyle(
        fontSize: 12,
        color: Colors.black,
        fontFamily: 'Poppins',
      ),
      buttonStyleData: widget.buttonStyleData == null
          ? null
          : FormFieldButtonStyleData(
              height: widget.buttonStyleData!.height,
              width: widget.buttonStyleData!.width,
              padding: widget.buttonStyleData!.padding,
              decoration: widget.buttonStyleData!.decoration,
              foregroundDecoration:
                  widget.buttonStyleData!.foregroundDecoration,
              elevation: widget.buttonStyleData!.elevation,
            ),
      menuItemStyleData:
          widget.menuItemStyleData ?? _defaultMenuItemStyleData(),
      hint: SPText(
        widget.placeHolder,
        style: TextStyle(
          fontSize: 14,
          color: Colors.grey.withAlpha((255 * 0.4).toInt()),
        ),
      ),
      onChanged: (value) {
        state.didChange(value);
        widget.onChanged?.call(value);
      },
    );
  }

  DropdownStyleData _defaultDropdownStyleData() {
    return DropdownStyleData(
      maxHeight: widget.maxHeight ?? 200,
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      elevation: 0,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.all(AppTheme.of(context).radius.large),
      ),
      scrollbarTheme: ScrollbarThemeData(
        thickness: WidgetStateProperty.all(6),
        thumbVisibility: WidgetStateProperty.all(true),
      ),
    );
  }

  MenuItemStyleData _defaultMenuItemStyleData() {
    return const MenuItemStyleData(padding: EdgeInsets.zero);
  }

  InputDecoration _buildInputDecoration() {
    return InputDecoration(
      prefixIcon: widget.prefix,
      fillColor: widget.backgroundColor,
      labelStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 12),
      hintStyle: const TextStyle(fontFamily: 'Poppins', fontSize: 12),
      filled: widget.backgroundColor != null,
      contentPadding:
          widget.contentPadding ?? const EdgeInsets.only(right: 10),
      border: widget.border ??
          OutlineInputBorder(
            borderRadius:
                BorderRadius.all(AppTheme.of(context).radius.medium),
          ),
    );
  }

  Widget _buildErrorText(FormFieldState<R> state) {
    return Column(
      children: [
        const SizedBox(height: 5),
        SPText(
          state.errorText ?? '',
          style: const TextStyle(color: Colors.redAccent),
        ),
        const SizedBox(height: 3),
      ],
    );
  }
}
