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

    return FormBuilderField(
      name: name,
      initialValue: initialValue,
      validator: validator,
      valueTransformer: valueTransformer,
      onChanged: onChanged,
      focusNode: focusNode,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius ?? BorderRadius.circular(10),
                border: Border.all(
                  color: field.hasError ? SPColorsData.defaultColors().rouge : SPColorsData.defaultColors().noir,
                ),
              ),
              child: SizedBox(
                height: height,
                child: TextFormField(
                  initialValue: field.value.toString(),
                  focusNode: focusNode,
                  style: TextStyle(
                    fontSize: fontSize ?? 14.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                  readOnly: readOnly,
                  controller: controller,
                  obscureText: type == AppTextFieldType.password ? obscureText : false,
                  decoration: inputDecoration.copyWith(
                    border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    disabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                  ),
                  onChanged: (value) => field.didChange(value),
                  textCapitalization: textCapitalization,
                  onEditingComplete: onEditingComplete,
                  maxLines: type == AppTextFieldType.password ? 1 : maxLines ?? 1,
                  keyboardType: type == AppTextFieldType.password ? TextInputType.text : keyboardType,
                ),
              ),
            ),
            if (field.hasError) ...[
              const SizedBox(height: 5),
              SPText(
                field.errorText ?? '',
                fontSize: 12,
                color: Colors.red,
              ),
            ]
          ],
        );
      },
    );
  }
}
