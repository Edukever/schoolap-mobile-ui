part of '../widget.dart';

typedef Validator<T> = String? Function(T?)?;

class SPRadio<T> extends StatelessWidget {
  final String name;
  final FormBuilderFieldOptionList<T> options;
  final Validator<T>? validator;
  final String? label;
  final T? initialValue;
  final TextStyle? labelStyle;
  final WrapAlignment? wrapAlignment;
  final WrapCrossAlignment? wrapCrossAxisAlignment;
  final OptionsOrientation? orientation;
  final Axis? wrapDirection;
  final double? wrapRunSpacing;
  final double? wrapSpacing;
  const SPRadio({
    Key? key,
    required this.name,
    required this.options,
    this.validator,
    this.label,
    this.initialValue,
    this.labelStyle,
    this.wrapAlignment,
    this.wrapCrossAxisAlignment,
    this.orientation,
    this.wrapDirection,
    this.wrapRunSpacing,
    this.wrapSpacing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return ListTileTheme(
      horizontalTitleGap: 0,
      child: FormBuilderRadioGroup(
        name: name,
        initialValue: initialValue,
        options: options,
        wrapAlignment: wrapAlignment ?? WrapAlignment.spaceBetween,
        wrapCrossAxisAlignment: wrapCrossAxisAlignment ?? WrapCrossAlignment.center,
        focusColor: theme.colors.bleu,
        activeColor: theme.colors.bleu,
        orientation: orientation ?? OptionsOrientation.wrap,
        wrapDirection: wrapDirection ?? Axis.horizontal,
        wrapRunSpacing: wrapRunSpacing ?? 0.0,
        wrapSpacing: wrapSpacing ?? 0.0,
        validator: validator,
        decoration: InputDecoration(
          label: label != null
              ? SPText(
                  label!,
                  fontSize: 14,
                )
              : null,
          labelStyle: TextStyle(fontSize: 14, fontFamily: "Poppins"),
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
