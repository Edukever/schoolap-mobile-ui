part of '../widget.dart';

typedef Validator<T> = String? Function(T?)?;
typedef OnChanged<T> = void Function(T?)?;

class SPRadio<T> extends StatelessWidget {
  const SPRadio({
    super.key,
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
    this.horizontalTitleGap = 0.0,
  });

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
  final double horizontalTitleGap;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);

    return ListTileTheme(
      horizontalTitleGap: horizontalTitleGap,
      child: FormBuilderRadioGroup(
        name: name,
        initialValue: initialValue,
        options: options,
        wrapAlignment: wrapAlignment ?? WrapAlignment.spaceBetween,
        wrapCrossAxisAlignment: wrapCrossAxisAlignment ?? WrapCrossAlignment.center,
        focusColor: theme.colors.orange,
        activeColor: theme.colors.orange,
        orientation: orientation ?? OptionsOrientation.wrap,
        wrapDirection: wrapDirection ?? Axis.horizontal,
        wrapRunSpacing: wrapRunSpacing ?? 0.0,
        wrapSpacing: wrapSpacing ?? 0.0,
        validator: validator,
        decoration: InputDecoration(
          label: label != null ? SPText(label!, style: const TextStyle(fontSize: 14)) : null,
          labelStyle: labelStyle ?? const TextStyle(fontSize: 14, fontFamily: 'Poppins'),
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
