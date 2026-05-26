part of '../widget.dart';

enum SPChipType { none, icon, dot }

class SPChip extends StatelessWidget {
  const SPChip({
    super.key,
    required this.label,
    this.width,
    this.height,
    this.color,
    this.type = SPChipType.none,
    this.icon,
    this.backgroundColor,
    this.mainAxisAlignment,
    this.textStyle,
  }) : assert(
          type != SPChipType.icon || icon != null,
          'icon must be provided when type is SPChipType.icon.',
        );

  final String label;
  final double? width;
  final double? height;

  /// Color applied to the dot indicator, icon, and text.
  final Color? color;

  final SPChipType type;

  /// Required when [type] is [SPChipType.icon].
  final Widget? icon;

  final Color? backgroundColor;
  final MainAxisAlignment? mainAxisAlignment;

  /// Overrides the default label style. Merged on top of the 14 px base.
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 125,
      height: height ?? 40,
      padding: const EdgeInsets.symmetric(horizontal: 14.62, vertical: 3.48),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFFFFE1E1),
        borderRadius: BorderRadius.all(AppTheme.of(context).radius.extraSmall),
      ),
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceAround,
        children: [
          if (type == SPChipType.dot)
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: DotContainer(color: color),
            ),
          if (type == SPChipType.icon) icon!,
          Expanded(
            child: SPText.title1(
              label,
              style: TextStyle(fontSize: 14, color: color ?? Colors.white)
                  .merge(textStyle),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Deprecated ───────────────────────────────────────────────────────────────

@Deprecated(
  'Use SPChipType instead.\n'
  'Migration: AppChipType.none → SPChipType.none, '
  'AppChipType.dot → SPChipType.dot, '
  'AppChipType.icon → SPChipType.icon.\n'
  'Will be removed in a future version.',
)
typedef AppChipType = SPChipType;
