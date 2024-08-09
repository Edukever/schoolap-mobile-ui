part of '../widget.dart';

class SPDateFieldRanger<T> extends StatelessWidget {
  final String name;

  /// The placeholder text for the text field.
  final String placeHolder;

  /// The border radius of the text field.
  final BorderRadius? borderRadius;

  /// The label text for the text field.
  final String? label;

  /// The validator function for the text field.
  final String? Function(DateTimeRange?)? validator;

  /// The suffix widget for the text field.
  final Widget? suffix;

  /// The prefix widget for the text field.
  final Widget? prefix;

  /// The maximum number of lines for the text field.
  final int? maxLines;

  /// The hint style for the text field.
  final TextStyle? hintStyle;

  /// The initial value for the text field.
  final DateTimeRange? initialValue;

  /// The keyboard type for the text field.
  final TextInputType? keyboardType;

  /// The onChanged callback for the text field.
  final Function(DateTimeRange?)? onChanged;

  /// The value transformer for the text field.
  final dynamic Function(DateTimeRange?)? valueTransformer;

  /// the value of the firstDate
  final DateTime firstDate;

  /// the value of the lastDate
  final DateTime? lastDate;

  final DateTime? currentDate;

  final EdgeInsetsGeometry? contentPadding;

  final DatePickerEntryMode initialEntryMode;

  final DateFormat? format;
  final double? fontSizeLabel;
  final double? fontSizePlaceHolder;

  /// Creates a new instance of `SPTextField`.
  const SPDateFieldRanger({
    super.key,
    required this.name,
    required this.placeHolder,
    this.borderRadius,
    this.label,
    this.validator,
    this.suffix,
    this.prefix,
    this.maxLines,
    this.hintStyle,
    this.initialValue,
    this.keyboardType,
    this.onChanged,
    this.valueTransformer,
    required this.firstDate,
    this.lastDate,
    this.currentDate,
    this.contentPadding,
    this.format,
    this.fontSizeLabel,
    this.fontSizePlaceHolder,
    this.initialEntryMode = DatePickerEntryMode.calendar,
  });

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
              style: TextStyle(
                fontSize: fontSizeLabel ?? 14.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        FormBuilderDateRangePicker(
          name: name,
          firstDate: firstDate,
          lastDate: lastDate ?? DateTime.now(),
          validator: validator,
          currentDate: currentDate,
          initialValue: initialValue,
          style: TextStyle(
            fontSize: fontSizeLabel ?? 14.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
          onChanged: onChanged,
          format: format,
          valueTransformer: valueTransformer,
          initialEntryMode: initialEntryMode,
          decoration: SPCustomInputDecoration(
            hintText: placeHolder,
            hintStyle: TextStyle(
              fontSize: fontSizePlaceHolder ?? 14.0,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
            prefixIcon: prefix,
            suffixIcon: suffix,
            contentPadding: contentPadding,
          ),
        ),
      ],
    );
  }
}
