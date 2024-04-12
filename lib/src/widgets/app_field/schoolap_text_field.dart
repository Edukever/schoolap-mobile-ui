part of '../widget.dart';

typedef ValidatorDate = Validator<DateTime>?;

enum AppTextFieldType { password }

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
  final String? Function(String?)? validator;

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

  /// The text capitalization for the text field.
  final TextCapitalization textCapitalization;

  final TextEditingController? controller;

  final void Function()? onEditingComplete;

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
    this.textCapitalization = TextCapitalization.none,
    this.controller,
    this.onEditingComplete,
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
            child: SPText(
              label!,
              fontSize: 14.0,
            ),
          ),
        if (type == AppTextFieldType.password)
          FormBuilderTextField(
            name: name,
            readOnly: readOnly,
            controller: controller,
            initialValue: initialValue,
            obscureText: obscureText,
            validator: validator,
            decoration: inputDecoration,
            onChanged: onChanged,
            valueTransformer: valueTransformer,
            textCapitalization: textCapitalization,
            onEditingComplete: onEditingComplete,
          )
        else
          FormBuilderTextField(
            name: name,
            initialValue: initialValue,
            readOnly: readOnly,
            controller: controller,
            maxLines: maxLines ?? 1,
            validator: validator,
            keyboardType: keyboardType,
            decoration: inputDecoration,
            textCapitalization: textCapitalization,
            onChanged: onChanged,
            valueTransformer: valueTransformer,
            onEditingComplete: onEditingComplete,
          ),
      ],
    );
  }
}
