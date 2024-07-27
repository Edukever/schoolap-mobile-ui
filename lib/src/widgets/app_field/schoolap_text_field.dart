part of '../widget.dart';

typedef ValidatorDate = Validator<DateTime>?;

enum AppTextFieldType { password }

/// A custom text field widget for the app.
class SPTextField<T> extends StatelessWidget {
  final String name;
  final String placeHolder;
  final BorderRadius? borderRadius;
  final String? label;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefix;
  final int? maxLines;
  final AppTextFieldType? type;
  final bool obscureText;
  final TextStyle? hintStyle;
  final bool readOnly;
  final String? initialValue;
  final TextInputType? keyboardType;
  final void Function(String?)? onChanged;
  final dynamic Function(String?)? valueTransformer;
  final TextCapitalization textCapitalization;
  final TextEditingController? controller;
  final void Function()? onEditingComplete;
  final Color? backgroundColor;
  final FocusNode? focusNode;
  final double? fontSizeLabel;
  final double? fontSize;
  final double? height;
  final EdgeInsets? contentPadding;
  final InputBorder? border;

  const SPTextField({
    Key? key,
    required this.name,
    required this.placeHolder,
    this.borderRadius,
    this.border,
    this.label,
    this.fontSizeLabel,
    this.fontSize,
    this.validator,
    this.height,
    this.suffix,
    this.maxLines,
    this.prefix,
    this.type,
    this.obscureText = false,
    this.hintStyle,
    this.readOnly = false,
    this.initialValue,
    this.contentPadding,
    this.keyboardType,
    this.onChanged,
    this.valueTransformer,
    this.textCapitalization = TextCapitalization.none,
    this.controller,
    this.backgroundColor,
    this.onEditingComplete,
    this.focusNode,
  })  : assert(!(obscureText == true && type != AppTextFieldType.password), 'obscureText can only be used when the type is password'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) _buildLabel(),
        _buildTextField(),
      ],
    );
  }

  Widget _buildLabel() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SPText(
        label!,
        fontSize: fontSizeLabel ?? 14.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTextField() {
    final inputDecoration = SPCustomInputDecoration(
      suffixIcon: suffix,
      prefixIcon: prefix,
      hintText: placeHolder,
      hintStyle: hintStyle,
      backgroundColor: backgroundColor,
      contentPadding: contentPadding,
      border: border,
    );

    return SizedBox(
        // remove height  on validation error
        height: height,
        child: FormBuilderTextField(
          name: name,
          focusNode: focusNode,
          style: TextStyle(
            fontSize: fontSize ?? 14.0,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w400,
          ),
          readOnly: readOnly,
          controller: controller,
          initialValue: initialValue,
          obscureText: type == AppTextFieldType.password ? obscureText : false,
          validator: validator,
          decoration: inputDecoration,
          onChanged: onChanged,
          valueTransformer: valueTransformer,
          textCapitalization: textCapitalization,
          onEditingComplete: onEditingComplete,
          maxLines: type == AppTextFieldType.password ? 1 : maxLines ?? 1,
          keyboardType: type == AppTextFieldType.password ? TextInputType.text : keyboardType,
        ));
  }
}
