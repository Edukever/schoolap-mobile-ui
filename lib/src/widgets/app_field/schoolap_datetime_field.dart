part of '../widget.dart';

class SPDateTimeField<T> extends StatelessWidget {
  const SPDateTimeField({
    super.key,
    required this.name,
    required this.placeHolder,
    this.borderRadius,
    this.label,
    this.labelStyle,
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
    this.initialEntryMode = DatePickerEntryMode.calendar,
    this.timePickerInitialEntryMode = TimePickerEntryMode.input,
    this.initialDatePickerMode = DatePickerMode.day,
    this.fontSize,
    this.height,
    this.style = const TextStyle(),
  });

  final String name;
  final String placeHolder;
  final BorderRadius? borderRadius;
  final String? label;
  final TextStyle? labelStyle;
  final String? Function(DateTime?)? validator;
  final Widget? suffix;
  final Widget? prefix;
  final TextStyle? hintStyle;
  final bool readOnly;
  final DateTime? initialValue;

  /// The date the calendar opens to when displayed. Defaults to the current date.
  /// To preset the widget's value, use [initialValue] instead.
  final DateTime? initialDate;

  /// The earliest choosable date. Defaults to 1900.
  final DateTime? firstDate;

  /// The latest choosable date. Defaults to 2100.
  final DateTime? lastDate;
  final TextInputType? keyboardType;
  final void Function(DateTime?)? onChanged;
  final dynamic Function(DateTime?)? valueTransformer;
  final DateFormat? dateFormat;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputType inputType;
  final TimeOfDay initialTime;
  final DatePickerEntryMode initialEntryMode;
  final TimePickerEntryMode timePickerInitialEntryMode;
  final DatePickerMode initialDatePickerMode;
  final double? fontSize;
  final double? height;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    final inputDecoration = SPCustomInputDecoration(
      suffixIcon: suffix,
      prefixIcon: prefix,
      hintText: placeHolder,
      hintStyle: hintStyle,
    );

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
        SizedBox(
          height: height,
          child: FormBuilderDateTimePicker(
            focusNode: focusNode,
            name: name,
            initialValue: initialValue,
            initialDate: initialDate,
            firstDate: firstDate,
            style: style.copyWith(
              fontSize: fontSize ?? 14.0,
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
