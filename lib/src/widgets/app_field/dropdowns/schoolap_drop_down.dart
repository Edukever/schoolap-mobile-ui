part of '../../widget.dart';

typedef OnChanged<T> = void Function(T?);

@Deprecated('Use [SPDropDownStyled] instead')
class SPDropDown<T> extends StatefulWidget {
  final String name;
  final List<DropdownMenuItem<T>> items;
  final OnChanged<T>? onChanged;
  final Validator<Object>? validator;
  final String placeHolder;
  final String? label;
  final Widget? prefix;
  final T? initialValue;
  final dynamic Function(T?)? valueTransformer;
  final FocusNode? focusNode;
  final Color? backgroundColor;
  final ButtonStyleData? buttonStyleData;
  final IconStyleData iconStyleData;
  final DropdownStyleData? dropdownStyleData;
  final MenuItemStyleData? menuItemStyleData;
  final InputBorder? border;

  const SPDropDown({
    super.key,
    required this.name,
    required this.items,
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
  State<SPDropDown<T>> createState() => _SPDropDownState<T>();
}

class _SPDropDownState<T> extends State<SPDropDown<T>> {
  late final ValueNotifier<T?> _valueNotifier;

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier<T?>(widget.initialValue);
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
        if (widget.label != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SPText(
              widget.label!,
              style: const TextStyle(fontSize: 14.0),
            ),
          ),
        FormBuilderField<T>(
          name: widget.name,
          validator: widget.validator,
          initialValue: widget.initialValue,
          valueTransformer: widget.valueTransformer,
          focusNode: widget.focusNode,
          builder: (state) {
            _valueNotifier.value = state.value;
            return DropdownButtonFormField2<T>(
              valueListenable: _valueNotifier,
              items: widget.items
                  .map(
                    (item) => DropdownItem<T>(
                      value: item.value,
                      enabled: item.enabled,
                      alignment: item.alignment,
                      onTap: item.onTap,
                      child: item.child,
                    ),
                  )
                  .toList(),
              isExpanded: true,
              decoration: InputDecoration(
                prefixIcon: widget.prefix,
                fillColor: widget.backgroundColor,
                filled: widget.backgroundColor != null,
                contentPadding: const EdgeInsets.only(right: 10),
                border: widget.border ??
                    OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(AppTheme.of(context).radius.medium),
                    ),
                // Add more decoration..
              ),
              iconStyleData: widget.iconStyleData,
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
              dropdownStyleData: widget.dropdownStyleData ??
                  DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.all(AppTheme.of(context).radius.large),
                    ),
                  ),
              menuItemStyleData: widget.menuItemStyleData ??
                  const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
              hint: SPText(
                widget.placeHolder,
                style: const TextStyle(fontSize: 14),
              ),
              onChanged: (value) {
                state.didChange(value);
                widget.onChanged?.call(value);
              },
            );
          },
        ),
      ],
    );
  }
}
