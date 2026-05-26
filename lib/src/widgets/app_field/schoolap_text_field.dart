part of '../widget.dart';

typedef ValidatorDate = Validator<DateTime>?;

enum SPTextFieldType { password }

class SPTextField<T> extends StatefulWidget {
  const SPTextField({
    super.key,
    required this.name,
    required this.placeHolder,
    this.borderRadius,
    this.border,
    this.label,
    this.labelStyle,
    this.textStyle,
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
    this.borderColor,
    this.inputFormatters,
    this.onTap,
  }) : assert(
          !(obscureText == true && type != SPTextFieldType.password),
          'obscureText can only be used when type is SPTextFieldType.password',
        );

  final String name;
  final String placeHolder;
  final BorderRadius? borderRadius;
  final String? label;
  final TextStyle? labelStyle;

  /// Overrides the default input text style (14 px, Poppins, w400).
  final TextStyle? textStyle;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefix;
  final int? maxLines;
  final SPTextFieldType? type;
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
  final double? height;
  final EdgeInsets? contentPadding;
  final InputBorder? border;
  final Color? borderColor;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;

  @override
  State<SPTextField<T>> createState() => _SPTextFieldState<T>();
}

class _SPTextFieldState<T> extends State<SPTextField<T>> {
  late final TextEditingController textEditingController;
  late final FocusNode focusNode;
  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    textEditingController =
        widget.controller ?? TextEditingController(text: widget.initialValue);
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(() {
      if (mounted) setState(() => hasFocus = focusNode.hasFocus);
    });
  }

  @override
  void dispose() {
    textEditingController.dispose();
    focusNode.dispose();
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
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)
            .merge(widget.labelStyle),
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
        if (value is String && textEditingController.text != value) {
          textEditingController.text = value;
        }
        widget.onChanged?.call(value);
      },
      onReset: () => textEditingController.clear(),
      focusNode: focusNode,
      builder: (field) {
        final borderColor = switch (field.hasError) {
          true => SPColorsData.defaultColors().red,
          false => switch (hasFocus) {
              true => SPColorsData.defaultColors().black,
              false => widget.borderColor ?? SPColorsData.defaultColors().gray2,
            },
        };
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius ??
                    BorderRadius.all(AppTheme.of(context).radius.medium),
                border: Border.all(color: borderColor),
              ),
              child: SizedBox(
                height: widget.height,
                child: TextField(
                  onTap: widget.onTap,
                  focusNode: focusNode,
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ).merge(widget.textStyle),
                  readOnly: widget.readOnly,
                  controller: textEditingController,
                  obscureText: widget.type == SPTextFieldType.password
                      ? widget.obscureText
                      : false,
                  decoration: inputDecoration.copyWith(
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                    disabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent)),
                  ),
                  onChanged: (value) => field.didChange(value),
                  textCapitalization: widget.textCapitalization,
                  onEditingComplete: widget.onEditingComplete,
                  maxLines: widget.type == SPTextFieldType.password
                      ? 1
                      : widget.maxLines ?? 1,
                  keyboardType: widget.type == SPTextFieldType.password
                      ? TextInputType.text
                      : widget.keyboardType,
                  inputFormatters: widget.inputFormatters,
                ),
              ),
            ),
            if (field.hasError) ...[
              const SizedBox(height: 5),
              SPText(
                field.errorText ?? '',
                style: const TextStyle(fontSize: 12, color: Colors.red),
              ),
            ],
          ],
        );
      },
    );
  }
}

// ─── Deprecated ───────────────────────────────────────────────────────────────

@Deprecated(
  'Use SPTextFieldType instead.\n'
  'Migration: AppTextFieldType.password → SPTextFieldType.password.\n'
  'Will be removed in a future version.',
)
typedef AppTextFieldType = SPTextFieldType;
