part of '../widget.dart';

class SPDateFieldRanger<T> extends StatelessWidget {
  const SPDateFieldRanger({
    super.key,
    required this.name,
    required this.placeHolder,
    this.borderRadius,
    this.label,
    this.labelStyle,
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
    this.initialEntryMode = DatePickerEntryMode.calendar,
    this.style = const TextStyle(),
  });

  final String name;
  final String placeHolder;
  final BorderRadius? borderRadius;
  final String? label;
  final TextStyle? labelStyle;
  final String? Function(DateTimeRange?)? validator;
  final Widget? suffix;
  final Widget? prefix;
  final int? maxLines;
  final TextStyle? hintStyle;
  final DateTimeRange? initialValue;
  final TextInputType? keyboardType;
  final Function(DateTimeRange?)? onChanged;
  final dynamic Function(DateTimeRange?)? valueTransformer;
  final DateTime firstDate;
  final DateTime? lastDate;
  final DateTime? currentDate;
  final EdgeInsetsGeometry? contentPadding;
  final DatePickerEntryMode initialEntryMode;
  final DateFormat? format;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: SPText(
              label!,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)
                  .merge(labelStyle),
            ),
          ),
        FormBuilderDateRangePicker(
          name: name,
          firstDate: firstDate,
          lastDate: lastDate ?? DateTime.now(),
          validator: validator,
          currentDate: currentDate,
          initialValue: initialValue,
          style: style.copyWith(
            fontSize: 14.0,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
          onChanged: onChanged,
          format: format,
          valueTransformer: valueTransformer,
          initialEntryMode: initialEntryMode,
          decoration: SPCustomInputDecoration(
            hintText: placeHolder,
            hintStyle: hintStyle,
            prefixIcon: prefix,
            suffixIcon: suffix,
            contentPadding: contentPadding,
          ),
        ),
      ],
    );
  }
}
