part of '../widget.dart';

typedef FormBuilderFieldOptionList<T> = List<FormBuilderFieldOption<T>>;
typedef ValidatorList<T> = String? Function(List<T>?)?;

class SPCheckBoxGroup<T> extends StatelessWidget {
  const SPCheckBoxGroup({
    super.key,
    this.label,
    required this.name,
    required this.options,
    this.validator,
    this.initialValue,
  });

  final String name;
  final String? label;
  final FormBuilderFieldOptionList<T> options;
  final ValidatorList<T>? validator;
  final List<T>? initialValue;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return FormBuilderCheckboxGroup<T>(
      name: name,
      options: options,
      initialValue: initialValue,
      focusColor: theme.colors.blue,
      activeColor: theme.colors.blue,
      checkColor: theme.colors.white,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        border: InputBorder.none,
      ),
    );
  }
}
