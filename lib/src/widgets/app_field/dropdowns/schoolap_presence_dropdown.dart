part of '../../widget.dart';

class SPPresenceDropdown extends StatefulWidget {
  const SPPresenceDropdown({
    super.key,
    required this.name,
    this.items,
    this.onChanged,
  });

  final String name;
  final List<DropdownMenuItem<bool>>? items;
  final void Function(bool)? onChanged;

  @override
  State<SPPresenceDropdown> createState() => _SPPresenceDropdownState();
}

class _SPPresenceDropdownState extends State<SPPresenceDropdown> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    final fillColor = value ? theme.colors.greenLight : theme.colors.redLight;
    final infillColor = value ? theme.colors.redLight : theme.colors.greenLight;
    final color = value ? theme.colors.green : theme.colors.red;

    return Container(
      decoration: BoxDecoration(
        color: theme.colors.greenLight,
        borderRadius: BorderRadius.all(theme.radius.small),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(theme.radius.small),
        child: FormBuilderDropdown<bool>(
          name: widget.name,
          initialValue: value,
          onChanged: (v) {
            setState(() => value = v == true);
            widget.onChanged?.call(value);
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusColor: fillColor,
            fillColor: fillColor,
            filled: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 7.0),
          ),
          icon: Icon(Icons.arrow_drop_down, color: color),
          iconSize: 30,
          isDense: false,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
          dropdownColor: infillColor,
          focusColor: fillColor,
          items: widget.items ??
              [
                DropdownMenuItem(
                  value: true,
                  child: SPPresenceDropdownItemWidget(
                    label: 'Présent',
                    color: theme.colors.green,
                  ),
                ),
                DropdownMenuItem(
                  value: false,
                  child: SPPresenceDropdownItemWidget(
                    label: 'Absent',
                    color: theme.colors.red,
                  ),
                ),
              ],
        ),
      ),
    );
  }
}

class SPPresenceDropdownItemWidget extends StatelessWidget {
  const SPPresenceDropdownItemWidget({
    super.key,
    required this.label,
    required this.color,
  });

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          DotContainer(color: color, size: 8),
          const SizedBox(width: 6.0),
          SPText(label, style: TextStyle(color: color)),
        ],
      ),
    );
  }
}
