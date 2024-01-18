import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:schoolap_pkg/src/utils/custom_tydef.dart';

enum AppTextFieldType {
  password,
  date,
}

/// A custom text field widget for the app.
class AppTextField<T> extends StatelessWidget {
  /// The name of the text field.
  final String name;

  /// The placeholder text for the text field.
  final String placeHolder;

  /// The border radius of the text field.
  final BorderRadius? borderRadius;

  /// The label text for the text field.
  final String? label;

  /// The validator function for the text field.
  final Validator<T>? validator;

  /// The suffix widget for the text field.
  final Widget? suffix;

  /// The prefix widget for the text field.
  final Widget? prefix;

  /// The maximum number of lines for the text field.
  final int? maxLines;

  /// The type of the text field.
  final AppTextFieldType? type;

  /// Whether the text field should obscure the text.
  final bool obscureText;

  /// Creates a new instance of `AppTextField`.
  const AppTextField({
    Key? key,
    required this.name,
    required this.placeHolder,
    this.borderRadius,
    this.label,
    this.validator,
    this.suffix,
    this.maxLines,
    this.prefix,
    this.type,
    this.obscureText = false,
  })  : assert(!(obscureText == true && type != AppTextFieldType.password),
            'obscureText can only be used when the type is password'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputDecoration = InputDecoration(
      suffixIcon: suffix,
      prefixIcon: prefix,
      contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      hintText: placeHolder,
      hintStyle: const TextStyle(
        fontSize: 13,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(10),
      ),
    );

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
        if (type == AppTextFieldType.password)
          FormBuilderTextField(
            name: name,
            obscureText: obscureText,
            validator: validator as String? Function(String?)?,
            decoration: inputDecoration,
          ),
        if (type == AppTextFieldType.date)
          FormBuilderDateTimePicker(
            name: name,
            validator: validator as String? Function(DateTime?)?,
            inputType: InputType.date,
            decoration: inputDecoration,
          ),
        if (type == null ||
            type != AppTextFieldType.password && type != AppTextFieldType.date)
          FormBuilderTextField(
            maxLines: maxLines,
            name: name,
            validator: validator as String? Function(String?)?,
            decoration: inputDecoration,
          ),
      ],
    );
  }
}
