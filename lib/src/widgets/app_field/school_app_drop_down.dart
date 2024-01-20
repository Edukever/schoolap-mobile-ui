import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:schoolap_ui/src/utils/custom_tydef.dart';

typedef OnChanged<T> = void Function(T?);

class SPDropDown<T> extends StatelessWidget {
  final String name;
  final List<DropdownMenuItem<T>> items;
  final OnChanged<T>? onChanged;
  final Validator<Object>? validator;
  final String placeHolder;
  final String? label;
  final Widget? prefix;
  const SPDropDown(
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
