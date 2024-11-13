part of '../widget.dart';

class SPDateTimeField<T> extends StatelessWidget {
  /// The name of the text field.
  final String name;

  /// The placeholder text for the text field.
  final String placeHolder;

  /// The border radius of the text field.
  final BorderRadius? borderRadius;

  /// The label text for the text field.
  final String? label;

  /// The validator function for the text field.
  final String? Function(DateTime?)? validator;

  /// The suffix widget for the text field.
  final Widget? suffix;

  /// The prefix widget for the text field.
  final Widget? prefix;

  /// The hint style for the text field.
  final TextStyle? hintStyle;

  /// Whether the text field is read-only.
  final bool readOnly;

  final DateTime? initialValue;

  /// The date the calendar opens to when displayed. Defaults to the current date.
  /// To preset the widget's value, use [initialValue] instead.
  final DateTime? initialDate;

  /// The earliest choosable date. Defaults to 1900.
  final DateTime? firstDate;

  /// The latest choosable date. Defaults to 2100
  final DateTime? lastDate;

  /// The keyboard type for the text field.
  final TextInputType? keyboardType;

  /// The onChanged callback for the text field.
  final void Function(DateTime?)? onChanged;

  /// The value transformer for the text field.
  final dynamic Function(DateTime?)? valueTransformer;

  /// Date Format of the date field
  final DateFormat? dateFormat;

  final TextEditingController? controller;

  final FocusNode? focusNode;

  final InputType inputType;

  final TimeOfDay initialTime;

  final DatePickerEntryMode initialEntryMode;

  final TimePickerEntryMode timePickerInitialEntryMode;

  final DatePickerMode initialDatePickerMode;
  final double? size;

  final double? height;

  final TextStyle style;

  const SPDateTimeField({
    super.key,
    required this.name,
    required this.placeHolder,
    this.borderRadius,
    this.label,
    this.validator,
    this.suffix,
    this.prefix,
    this.hintStyle,
    this.readOnly = false,
    this.initialDate,
    this.keyboardType,
    this.onChanged,
    this.valueTransformer,
    this.dateFormat,
    this.controller,
    this.firstDate,
    this.lastDate,
    this.focusNode,
    this.initialValue,
    this.inputType = InputType.date,
    this.initialTime = const TimeOfDay(hour: 12, minute: 0),
    this.initialEntryMode = DatePickerEntryMode.input,
    this.timePickerInitialEntryMode = TimePickerEntryMode.input,
    this.initialDatePickerMode = DatePickerMode.day,
    this.size,
    this.height,
    this.style = const TextStyle(),
  });

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
              style: TextStyle(
                fontSize: size ?? 14.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        SizedBox(
          height: height,
          child: FormBuilderDateTimePicker(
            focusNode: focusNode,
            name: name,
            initialValue: initialValue,
            initialDate: initialDate,
            firstDate: firstDate,
            style: style.copyWith(
              fontSize: size ?? 14.0,
              fontFamily: 'Poppins',
            ),
            lastDate: lastDate,
            validator: validator,
            inputType: inputType,
            decoration: inputDecoration,
            format: dateFormat,
            valueTransformer: valueTransformer,
            onChanged: onChanged,
            controller: controller,
            initialEntryMode: initialEntryMode,
            timePickerInitialEntryMode: timePickerInitialEntryMode,
            initialDatePickerMode: initialDatePickerMode,
          ),
        ),
      ],
    );
  }
}
