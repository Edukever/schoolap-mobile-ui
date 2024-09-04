part of '../widget.dart';

typedef ValidatorDate = Validator<DateTime>?;

enum AppTextFieldType { password }

/// A custom text field widget for the app.
class SPTextField<T> extends StatefulWidget {
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
    super.key,
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
  }) : assert(!(obscureText == true && type != AppTextFieldType.password), 'obscureText can only be used when the type is password');

  @override
  State<SPTextField<T>> createState() => _SPTextFieldState<T>();
}

class _SPTextFieldState<T> extends State<SPTextField<T>> {
  late final TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = widget.controller ?? TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null) _buildLabel(),
        _buildTextField(),
      ],
    );
  }

  Widget _buildLabel() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SPText(
        widget.label!,
        fontSize: widget.fontSizeLabel ?? 14.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildTextField() {
    final inputDecoration = SPCustomInputDecoration(
      suffixIcon: widget.suffix,
      prefixIcon: widget.prefix,
      hintText: widget.placeHolder,
      hintStyle: widget.hintStyle,
      backgroundColor: widget.backgroundColor,
      contentPadding: widget.contentPadding,
      border: widget.border,
    );

    return FormBuilderField(
      name: widget.name,
      initialValue: widget.initialValue,
      validator: widget.validator,
      valueTransformer: widget.valueTransformer,
      onChanged: (value) {
        if (value is String) textEditingController.text = value;
        widget.onChanged?.call(value);
      },
      onReset: () => textEditingController.clear(),
      focusNode: widget.focusNode,
      builder: (field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
                border: Border.all(
                  color: field.hasError ? SPColorsData.defaultColors().rouge : SPColorsData.defaultColors().noir,
                ),
              ),
              child: SizedBox(
                height: widget.height,
                child: TextField(
                  focusNode: widget.focusNode,
                  style: TextStyle(
                    fontSize: widget.fontSize ?? 14.0,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                  readOnly: widget.readOnly,
                  controller: textEditingController,
                  obscureText: widget.type == AppTextFieldType.password ? widget.obscureText : false,
                  decoration: inputDecoration.copyWith(
                    border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    errorBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                    disabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
                  ),
                  onChanged: (value) => field.didChange(value),
                  textCapitalization: widget.textCapitalization,
                  onEditingComplete: widget.onEditingComplete,
                  maxLines: widget.type == AppTextFieldType.password ? 1 : widget.maxLines ?? 1,
                  keyboardType: widget.type == AppTextFieldType.password ? TextInputType.text : widget.keyboardType,
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
