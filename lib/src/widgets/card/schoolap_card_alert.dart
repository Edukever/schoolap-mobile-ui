part of '../widget.dart';

enum SPCardAlertType {
  alert(
    background: Color(0xFFFFE1E1),
    color: Color(0xFFFF4F4F),
    icon: Icons.warning_amber,
  ),
  warning(
    background: Color(0xFFE5F9FF),
    color: Color(0xFF41A3DF),
    icon: Icons.warning_amber,
  ),
  info(
    background: Color(0xFFDDF3D6),
    color: Color(0xFF1EA951),
    icon: Icons.info_outline,
  ),
  success(
    background: Color(0xFFDDF3D6),
    color: Color(0xFF1EA951),
    icon: Icons.check_circle_outline,
  );

  const SPCardAlertType({
    required this.background,
    required this.color,
    required this.icon,
  });

  final Color background;
  final Color color;
  final IconData icon;
}

class SPCardAlert extends StatelessWidget {
  const SPCardAlert({
    super.key,
    required this.title,
    required this.type,
    this.onTap,
    this.icon,
    this.textStyle,
    this.maxLines = 2,
  });

  final String title;
  final SPCardAlertType type;
  final VoidCallback? onTap;

  /// Overrides the default type icon.
  final Widget? icon;

  /// Overrides the default text style. Color defaults to the type's color.
  final TextStyle? textStyle;

  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return SPCard(
      onTap: onTap,
      backgroundColor: type.background,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          icon ?? Icon(type.icon, color: type.color),
          const SizedBox(width: 10),
          Expanded(
            child: SPText(
              title,
              style: textStyle ?? TextStyle(fontSize: 14, color: type.color),
              level: AppTextLevel.paragraph1,
              maxLines: maxLines,
            ),
          ),
        ],
      ),
    );
  }
}
