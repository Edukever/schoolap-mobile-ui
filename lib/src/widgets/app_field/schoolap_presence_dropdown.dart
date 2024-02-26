part of '../widget.dart';

class SPPresenceDropdown extends StatefulWidget {
  final List<DropdownMenuItem<bool>>? items;
  final String name;
  final void Function(bool)? onChanged;

  const SPPresenceDropdown({
    super.key,
    required this.name,
    this.items,
    this.onChanged,
  });

  @override
  State<SPPresenceDropdown> createState() => _SPPresenceDropdownState();
}

class _SPPresenceDropdownState extends State<SPPresenceDropdown> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    final fillColor = value ? AppTheme.of(context).colors.vertLight : AppTheme.of(context).colors.rougeLight;
    final infillColor = value ? AppTheme.of(context).colors.rougeLight : AppTheme.of(context).colors.vertLight;
    final textColor = value ? AppTheme.of(context).colors.vert : AppTheme.of(context).colors.rouge;

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.of(context).colors.vertLight,
        borderRadius: BorderRadius.all(AppTheme.of(context).radius.small),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(AppTheme.of(context).radius.small),
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
            contentPadding: EdgeInsets.symmetric(horizontal: 7.0),
          ),
          icon: Icon(Icons.arrow_drop_down, color: textColor),
          iconSize: 30,
          isDense : false,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
          dropdownColor: infillColor,
          focusColor: fillColor,
          items: widget.items ??
              [
                DropdownMenuItem(
                  value: true,
                  child: SPPresenceDropdownItemWidget(label: "Présent", textColor: AppTheme.of(context).colors.vert),
                ),
                DropdownMenuItem(
                  value: false,
                  child: SPPresenceDropdownItemWidget(label: "Absent", textColor: AppTheme.of(context).colors.rouge),
                ),
              ],
        ),
      ),
    );
  }
}

class SPPresenceDropdownItemWidget extends StatelessWidget {
  final String label;
  final Color textColor;

  const SPPresenceDropdownItemWidget({
    super.key,
    required this.label,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 8.0,
            width: 8.0,
            decoration: BoxDecoration(
              color: textColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 6.0),
          Text(
            label,
            style: TextStyle(color: textColor),
          ),
        ],
      ),
    );
  }
}
