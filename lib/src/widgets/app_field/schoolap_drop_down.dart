part of '../widget.dart';

typedef OnChanged<T> = void Function(T?);

class SPDropDown<T> extends StatelessWidget {
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
            ),
          ),
        FormBuilderField<T>(
          name: name,
          validator: validator,
          initialValue: initialValue,
          valueTransformer: valueTransformer,
          focusNode: focusNode,
          builder: (state) {
            return DropdownButtonFormField2<T>(
              value: state.value,
              items: items,
              isExpanded: true,
              buttonStyleData: ButtonStyleData(
                
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
              ),
              decoration: InputDecoration(
                prefixIcon: prefix,

                contentPadding: const EdgeInsets.only(right: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                // Add more decoration..
              ),
              dropdownStyleData: DropdownStyleData(
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
              hint: SPText(
                placeHolder,
                fontSize: 14,
              ),
              onChanged: (value) {
                state.didChange(value);
                onChanged?.call(value);
              },
            );
          },
        ),
      ],
    );
  }
}
