part of '../widget.dart';

class SPDropDownPresence<T> extends StatelessWidget {
  final String name;
  final List<DropdownMenuItem<T>> items;
  final OnChanged<T>? onChanged;
  final Validator<Object>? validator;
  final String placeHolder;
  final String? label;
  final Widget? prefix;
  const SPDropDownPresence(
      {Key? key,
      required this.name,
      required this.items,
      this.onChanged,
      this.validator,
      required this.placeHolder,
      this.label,
      this.prefix})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              label!,
              style: const TextStyle(
                fontSize: 14.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        FormBuilderField(
          name: name,
          validator: validator,
          builder: (context) {
            return DropdownButtonFormField2<T>(
              items: items,
              isExpanded: true,
            
              buttonStyleData: ButtonStyleData(
                height: 50,
                width: 160,
                padding: const EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius .circular(14),
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
                placeHolder,
                style: const TextStyle(fontSize: 14),
              ),
              onChanged: onChanged,
            );
          },
        ),
      ],
    );
  }
}
