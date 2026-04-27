part of '../../widget.dart';

class SPDropDownPresence<T> extends StatefulWidget {
  final String name;
  final List<DropdownMenuItem<T>> items;
  final OnChanged<T>? onChanged;
  final Validator<Object>? validator;
  final String placeHolder;
  final String? label;
  final Widget? prefix;
  const SPDropDownPresence({
    super.key,
    required this.name,
    required this.items,
    this.onChanged,
    this.validator,
    required this.placeHolder,
    this.label,
    this.prefix,
  });

  @override
  State<SPDropDownPresence<T>> createState() => _SPDropDownPresenceState<T>();
}

class _SPDropDownPresenceState<T> extends State<SPDropDownPresence<T>> {
  late final ValueNotifier<T?> _valueNotifier;

  @override
  void initState() {
    super.initState();
    _valueNotifier = ValueNotifier<T?>(null);
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
            child: Text(
              widget.label!,
              style: const TextStyle(
                fontSize: 14.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        FormBuilderField<T>(
          name: widget.name,
          validator: widget.validator,
          builder: (state) {
            _valueNotifier.value = state.value;
            return DropdownButtonFormField2<T>(
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
              valueListenable: _valueNotifier,
              buttonStyleData: FormFieldButtonStyleData(
                height: 50,
                width: 160,
                padding: const EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: Colors.black26,
                  ),
                  color: Colors.redAccent,
                ),
                elevation: 2,
              ),
              dropdownStyleData: DropdownStyleData(
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
              ),
              hint: Text(
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
