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

  const SPDropDownStyled({
    super.key,
    required this.name,
    required this.items,
    required this.getName,
    required this.getValue,
    this.onChanged,
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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SPText(
              label!,
              fontSize: 14.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        FormBuilderField<R>(
          name: name,
          validator: validator,
          initialValue: initialValue,
          valueTransformer: valueTransformer,
          focusNode: focusNode,
          builder: (state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField2<R>(
                  value: state.value,
                  items: DropdownMenuItemGenerator<T, R>(
                    items: items,
                  ).generate(getName: getName, getValue: getValue),
                  dropdownStyleData: dropdownStyleData ??
                      DropdownStyleData(
                        maxHeight: 200,
                        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
                        elevation: 0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: const BorderRadius.all(Radius.circular(14)),
                        ),
                        scrollbarTheme: ScrollbarThemeData(
                          //   radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all(6),
                          thumbVisibility: MaterialStateProperty.all(true),
                        ),
                      ),
                  isExpanded: true,
                  decoration: InputDecoration(
                    prefixIcon: prefix,
                    fillColor: backgroundColor,
                    filled: backgroundColor != null,
                    contentPadding: const EdgeInsets.only(right: 10),
                    border: border ??
                        OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                    // Add more decoration..
                  ),
                  iconStyleData: iconStyleData,
                  buttonStyleData: buttonStyleData,
                  menuItemStyleData: menuItemStyleData ??
                      MenuItemStyleData(
                        padding: EdgeInsets.zero,
                        customHeights: DropdownMenuItemGenerator<T, R>(items: items).calculateItemHeights,
                      ),
                  hint: SPText(
                    placeHolder,
                    fontSize: 14,
                    color: Colors.grey.withOpacity(0.4),
                  ),
                  onChanged: (value) {
                    state.didChange(value);
                    onChanged?.call(value);
                  },
                ),
                if (state.hasError) ...[
                  SizedBox(height: 5),
                  SPText(state.errorText ?? '', color: AppTheme.of(context).colors.rouge),
                ]
              ],
            );
          },
        ),
      ],
    );
  }
}
