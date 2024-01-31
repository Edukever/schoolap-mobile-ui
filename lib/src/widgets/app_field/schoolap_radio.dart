part of '../widget.dart';

typedef Validator<T> = String? Function(T?)?;

class SPRadio<T> extends StatelessWidget {
  final String name;
  final FormBuilderFieldOptionList<T> options;
  final Validator<T>? validator;
  final String? label;
  final T? initialValue;
  final TextStyle? labelStyle;

  const SPRadio({
    Key? key,
    required this.name,
    required this.options,
    this.validator,
    this.label,
    this.initialValue,
    this.labelStyle,
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
            wrapAlignment: WrapAlignment.spaceBetween,
      wrapCrossAxisAlignment: WrapCrossAlignment.center,
        focusColor: theme.colors.bleu,
        activeColor: theme.colors.bleu,
        validator: validator,
        decoration: InputDecoration(
          label: label != null ? SPText(label!) : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 0),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
