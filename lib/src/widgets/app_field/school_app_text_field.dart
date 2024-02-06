part of '../widget.dart';

typedef ValidatorDate = Validator<DateTime>?;

enum AppTextFieldType {
  password,
  date,
}

/// A custom text field widget for the app.
class SPTextField<T> extends StatelessWidget {
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

  /// The hint style for the text field.
  final TextStyle? hintStyle;

  /// Whether the text field is read-only.
  final bool readOnly;

  /// The initial value for the text field.
  final String? initialValue;

  /// The keyboard type for the text field.
  final TextInputType? keyboardType;

  /// The onChanged callback for the text field.
  final void Function(String?)? onChanged;

  /// The value transformer for the text field.
  final dynamic Function(String?)? valueTransformer;

  final dynamic Function(DateTime?)? dateTimeValueTransformer;

  /// The text capitalization for the text field.
  final TextCapitalization textCapitalization;

  final DateFormat? dateFormat;

  final TextEditingController? controller;

  /// Creates a new instance of `SPTextField`.
  ///
  const SPTextField({
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
    this.hintStyle,
    this.readOnly = false,
    this.initialValue,
    this.keyboardType,
    this.onChanged,
    this.valueTransformer,
    this.dateTimeValueTransformer,
    this.dateFormat,
    this.textCapitalization = TextCapitalization.none,
    this.controller,
  })  : assert(!(obscureText == true && type != AppTextFieldType.password), 'obscureText can only be used when the type is password'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputDecoration = SPCustomInputDecoration(suffixIcon: suffix, prefixIcon: prefix, hintText: placeHolder, hintStyle: hintStyle);

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
            readOnly: readOnly,
            controller: controller,
            initialValue: initialValue,
            obscureText: obscureText,
            validator: validator as Validator<String?>?,
            decoration: inputDecoration,
            onChanged: onChanged,
            valueTransformer: valueTransformer,
            textCapitalization: textCapitalization,
          ),
        if (type == AppTextFieldType.date)
          FormBuilderDateTimePicker(
            name: name,
            validator: validator as ValidatorDate,
            inputType: InputType.date,
            decoration: inputDecoration,
            format: dateFormat,
            valueTransformer: dateTimeValueTransformer,
          ),
        if (type == null || type != AppTextFieldType.password && type != AppTextFieldType.date)
          FormBuilderTextField(
            maxLines: maxLines ?? 1,
            name: name,
            validator: validator as String? Function(String?)?,
            keyboardType: keyboardType,
            decoration: inputDecoration,
            textCapitalization: textCapitalization,
          ),
      ],
    );
  }
}
