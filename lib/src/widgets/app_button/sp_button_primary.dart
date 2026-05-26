part of '../widget.dart';

@Deprecated(
  'Use SPButtonVariant instead. '
  'DecorationState.solid → SPButtonVariant.filled (default), '
  'DecorationState.outline → SPButton.outlined() or SPButtonVariant.outlined. '
  'Will be removed in a future version.',
)
enum DecorationState { none, solid, outline }

@Deprecated(
  'Use leading/trailing Widget parameters on SPButton instead. '
  'IconPosition.left → leading: Icon(...), '
  'IconPosition.right → trailing: Icon(...). '
  'Will be removed in a future version.',
)
enum IconPosition { left, right }

@Deprecated(
  'Use SPButton instead.\n'
  'Migration guide:\n'
  '  title:           → positional label argument\n'
  '  onTap:           → onPressed:\n'
  '  backgroundColor: → color:\n'
  '  iconOrTextColor: → foregroundColor:\n'
  '  outlineBorderColor: → borderColor:\n'
  '  decorationState: DecorationState.outline → SPButton.outlined()\n'
  '  iconPosition: IconPosition.left  → leading: Icon(...)\n'
  '  iconPosition: IconPosition.right → trailing: Icon(...)\n'
  '  fontSize/fontWeight → labelStyle: TextStyle(...)\n'
  'Will be removed in a future version.',
)
class SPButtonPrimary extends StatelessWidget {
  // ignore: deprecated_member_use_from_same_package
  const SPButtonPrimary({
    super.key,
    required this.title,
    this.backgroundColor,
    this.decorationState,
    this.iconOrTextColor,
    this.outlineBorderColor,
    this.iconPosition,
    this.icon,
    this.onTap,
    this.height,
    this.width,
    this.radius,
    this.fontWeight,
    this.fontSize,
    this.mainAxisAlignment,
    this.maxLines,
    this.textAlign,
  });

  final String title;
  // ignore: deprecated_member_use_from_same_package
  final DecorationState? decorationState;
  final Color? backgroundColor;
  final Color? iconOrTextColor;
  final Color? outlineBorderColor;
  // ignore: deprecated_member_use_from_same_package
  final IconPosition? iconPosition;
  final Widget? icon;
  final VoidCallback? onTap;
  final double? height;
  final double? width;
  final double? radius;
  final FontWeight? fontWeight;
  final double? fontSize;
  final MainAxisAlignment? mainAxisAlignment;
  final int? maxLines;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use_from_same_package
    final variant = decorationState == DecorationState.outline
        ? SPButtonVariant.outlined
        : SPButtonVariant.filled;

    Widget? leading;
    Widget? trailing;
    final iconWidget =
        icon ?? Icon(Icons.arrow_forward, color: iconOrTextColor ?? Colors.white);
    // ignore: deprecated_member_use_from_same_package
    if (iconPosition == IconPosition.left) leading = iconWidget;
    // ignore: deprecated_member_use_from_same_package
    if (iconPosition == IconPosition.right) trailing = iconWidget;

    return SPButton(
      title,
      onPressed: onTap,
      variant: variant,
      leading: leading,
      trailing: trailing,
      color: backgroundColor,
      foregroundColor: iconOrTextColor,
      borderColor: outlineBorderColor,
      width: width,
      height: height,
      radius: radius,
      labelStyle: (fontWeight != null || fontSize != null)
          ? TextStyle(fontWeight: fontWeight, fontSize: fontSize)
          : null,
      textAlign: textAlign,
      maxLines: maxLines,
    );
  }
}
