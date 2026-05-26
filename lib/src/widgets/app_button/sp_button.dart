part of '../widget.dart';

enum SPButtonVariant { filled, outlined }

class SPButton extends StatelessWidget {
  const SPButton(
    this.label, {
    super.key,
    this.onPressed,
    this.variant = SPButtonVariant.filled,
    this.leading,
    this.trailing,
    this.color,
    this.foregroundColor,
    this.borderColor,
    this.width,
    this.height,
    this.radius,
    this.labelStyle,
    this.textAlign,
    this.maxLines,
  });

  const SPButton.outlined(
    this.label, {
    super.key,
    this.onPressed,
    this.leading,
    this.trailing,
    this.color,
    this.foregroundColor,
    this.borderColor,
    this.width,
    this.height,
    this.radius,
    this.labelStyle,
    this.textAlign,
    this.maxLines,
  }) : variant = SPButtonVariant.outlined;

  final String label;
  final VoidCallback? onPressed;
  final SPButtonVariant variant;
  final Widget? leading;
  final Widget? trailing;
  final Color? color;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? radius;
  final TextStyle? labelStyle;
  final TextAlign? textAlign;
  final int? maxLines;

  static const _kDefaultColor = Color(0xFFF68C2C);
  static const _kSplashColor = Color(0xFFFFF2EC);

  @override
  Widget build(BuildContext context) {
    final radiusValue = radius ?? AppTheme.of(context).radius.medium.x;
    final effectiveForeground = foregroundColor ?? Colors.white;

    final decoration = switch (variant) {
      SPButtonVariant.outlined => BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radiusValue),
          border: Border.all(color: borderColor ?? _kDefaultColor),
        ),
      SPButtonVariant.filled => BoxDecoration(
          color: color ?? _kDefaultColor,
          borderRadius: BorderRadius.circular(radiusValue),
        ),
    };

    final text = SPText(
      label,
      style: labelStyle?.copyWith(
            color: labelStyle?.color ?? effectiveForeground,
          ) ??
          TextStyle(color: effectiveForeground),
      textAlign: textAlign,
      maxLines: maxLines,
    );

    final content = (leading != null || trailing != null)
        ? Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (leading != null) ...[leading!, const SizedBox(width: 8)],
              text,
              if (trailing != null) ...[const SizedBox(width: 8), trailing!],
            ],
          )
        : text;

    return InkWell(
      splashColor: _kSplashColor,
      onTap: onPressed,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 50,
        decoration: decoration,
        alignment: Alignment.center,
        child: content,
      ),
    );
  }
}
