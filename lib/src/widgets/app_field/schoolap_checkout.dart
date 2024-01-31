part of '../widget.dart';

class SPCheckBox extends StatelessWidget {
  final String name;
  final Widget title;
  final Color? activeColor;
  final void Function(bool?)? onChanged;
  final bool? initialValue;
  final String? Function(bool?)? validator;

  const SPCheckBox({
    super.key,
    required this.name,
    required this.title,
    this.activeColor,
    this.onChanged,
    this.initialValue,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return ListTileTheme(
      horizontalTitleGap: 0,
      child: FormBuilderCheckbox(
        name: name,
        title: title,
        activeColor: activeColor ?? AppTheme.of(context).colors.bleu,
        onChanged: onChanged,
        initialValue: initialValue,
        validator: validator,
      ),
    );
  }
}
