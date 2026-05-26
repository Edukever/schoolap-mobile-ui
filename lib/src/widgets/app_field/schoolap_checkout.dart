part of '../widget.dart';

class SPCheckBox extends StatelessWidget {
  const SPCheckBox({
    super.key,
    required this.name,
    required this.title,
    this.activeColor,
    this.onChanged,
    this.initialValue,
    this.validator,
  });

  final String name;
  final Widget title;
  final Color? activeColor;
  final void Function(bool?)? onChanged;
  final bool? initialValue;
  final String? Function(bool?)? validator;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: ListTileTheme(
        horizontalTitleGap: 0,
        child: FormBuilderCheckbox(
          name: name,
          title: title,
          activeColor: activeColor ?? AppTheme.of(context).colors.blue,
          onChanged: onChanged,
          initialValue: initialValue,
          validator: validator,
        ),
      ),
    );
  }
}
