part of '../widget.dart';

enum _SPButtonIconShape { none, square, circle, outlined }

class SPButtonIcon extends StatelessWidget {
  const SPButtonIcon(
    this.iconData, {
    super.key,
    this.onPressed,
    this.iconColor,
    this.iconSize,
    this.width,
    this.height,
    this.showBadge = false,
    this.badgeColor,
    this.badgeLabel,
  })  : _shape = _SPButtonIconShape.none,
        _color = null,
        _hasShadow = false,
        _radius = null,
        _outlinedColor = null;

  const SPButtonIcon.square(
    this.iconData, {
    super.key,
    this.onPressed,
    this.iconColor,
    this.iconSize,
    this.width,
    this.height,
    Color? color,
    bool hasShadow = false,
    double? radius,
    this.showBadge = false,
    this.badgeColor,
    this.badgeLabel,
  })  : _shape = _SPButtonIconShape.square,
        _color = color,
        _hasShadow = hasShadow,
        _radius = radius,
        _outlinedColor = null;

  const SPButtonIcon.circle(
    this.iconData, {
    super.key,
    this.onPressed,
    this.iconColor,
    this.iconSize,
    this.width,
    this.height,
    Color? color,
    this.showBadge = false,
    this.badgeColor,
    this.badgeLabel,
  })  : _shape = _SPButtonIconShape.circle,
        _color = color,
        _hasShadow = false,
        _radius = null,
        _outlinedColor = null;

  const SPButtonIcon.outlined(
    this.iconData, {
    super.key,
    required Color outlinedColor,
    this.onPressed,
    this.iconColor,
    this.iconSize,
    this.width,
    this.height,
    double? radius,
    this.showBadge = false,
    this.badgeColor,
    this.badgeLabel,
  })  : _shape = _SPButtonIconShape.outlined,
        _color = null,
        _hasShadow = false,
        _radius = radius,
        _outlinedColor = outlinedColor;

  // ignore: deprecated_member_use_from_same_package
  @Deprecated(
    'Use SPButtonIcon named constructors instead.\n'
    'Migration guide:\n'
    '  SPButtonIcon(iconData: p, shape: ButtonIconShape.square, filledColor: c, hasShadow: true)\n'
    '      → SPButtonIcon.square(p, color: c, hasShadow: true)\n'
    '  SPButtonIcon(iconData: p, shape: ButtonIconShape.circle, filledColor: c)\n'
    '      → SPButtonIcon.circle(p, color: c)\n'
    '  SPButtonIcon(iconData: p, shape: ButtonIconShape.outlined, outlinedColor: c)\n'
    '      → SPButtonIcon.outlined(p, outlinedColor: c)\n'
    '  SPButtonIcon(iconData: p) / ButtonIconShape.none\n'
    '      → SPButtonIcon(p)\n'
    'Will be removed in a future version.',
  )
  // ignore: deprecated_member_use_from_same_package
  factory SPButtonIcon.fromShape({
    required String iconData,
    // ignore: deprecated_member_use_from_same_package
    ButtonIconShape shape = ButtonIconShape.none,
    Color? filledColor,
    Color? outlinedColor,
    bool hasShadow = false,
    double? radius,
    Color? iconColor,
    double? iconSize,
    double? width,
    double? height,
    bool showBadge = false,
    Color? badgeColor,
    Widget? badgeLabel,
    VoidCallback? onPressed,
  }) {
    // ignore: deprecated_member_use_from_same_package
    return switch (shape) {
      // ignore: deprecated_member_use_from_same_package
      ButtonIconShape.square => SPButtonIcon.square(
          iconData,
          color: filledColor,
          hasShadow: hasShadow,
          radius: radius,
          iconColor: iconColor,
          iconSize: iconSize,
          width: width,
          height: height,
          showBadge: showBadge,
          badgeColor: badgeColor,
          badgeLabel: badgeLabel,
          onPressed: onPressed,
        ),
      // ignore: deprecated_member_use_from_same_package
      ButtonIconShape.circle => SPButtonIcon.circle(
          iconData,
          color: filledColor,
          iconColor: iconColor,
          iconSize: iconSize,
          width: width,
          height: height,
          showBadge: showBadge,
          badgeColor: badgeColor,
          badgeLabel: badgeLabel,
          onPressed: onPressed,
        ),
      // ignore: deprecated_member_use_from_same_package
      ButtonIconShape.outlined => SPButtonIcon.outlined(
          iconData,
          outlinedColor: outlinedColor ?? const Color(0xFFF68C2C),
          radius: radius,
          iconColor: iconColor,
          iconSize: iconSize,
          width: width,
          height: height,
          showBadge: showBadge,
          badgeColor: badgeColor,
          badgeLabel: badgeLabel,
          onPressed: onPressed,
        ),
      // ignore: deprecated_member_use_from_same_package
      ButtonIconShape.none => SPButtonIcon(
          iconData,
          iconColor: iconColor,
          iconSize: iconSize,
          width: width,
          height: height,
          showBadge: showBadge,
          badgeColor: badgeColor,
          badgeLabel: badgeLabel,
          onPressed: onPressed,
        ),
    };
  }

  final String iconData;
  final VoidCallback? onPressed;
  final Color? iconColor;
  final double? iconSize;
  final double? width;
  final double? height;
  final bool showBadge;
  final Color? badgeColor;
  final Widget? badgeLabel;

  final _SPButtonIconShape _shape;
  final Color? _color;
  final bool _hasShadow;
  final double? _radius;
  final Color? _outlinedColor;

  static const _kDefaultSize = 70.0;
  static const _kDefaultSquareFill = Color(0xFF3F97E3);
  static const _kDefaultCircleFill = Color(0xFFE5F9FF);
  static const _kShadow = [
    BoxShadow(
      color: Color(0xDDB9D4D0),
      blurRadius: 10.71,
      offset: Offset(0, 4.29),
      spreadRadius: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final radiusValue = _radius ?? AppTheme.of(context).radius.medium.x;

    final decoration = switch (_shape) {
      _SPButtonIconShape.square => BoxDecoration(
          borderRadius: BorderRadius.circular(radiusValue),
          color: _color ?? _kDefaultSquareFill,
          boxShadow: _hasShadow ? _kShadow : null,
        ),
      _SPButtonIconShape.circle => BoxDecoration(
          color: _color ?? _kDefaultCircleFill,
          shape: BoxShape.circle,
        ),
      _SPButtonIconShape.outlined => BoxDecoration(
          border: Border.all(color: _outlinedColor!),
          borderRadius: BorderRadius.circular(radiusValue),
        ),
      _SPButtonIconShape.none => const BoxDecoration(),
    };

    final icon = SvgPicture.asset(
      iconData,
      colorFilter: iconColor != null
          ? ColorFilter.mode(iconColor!, BlendMode.srcIn)
          : null,
      height: iconSize,
      width: iconSize,
    );

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width ?? _kDefaultSize,
        height: height ?? _kDefaultSize,
        decoration: decoration,
        alignment: Alignment.center,
        child: showBadge
            ? Badge(
                isLabelVisible: true,
                backgroundColor: badgeColor ?? AppTheme.of(context).colors.blue,
                label: badgeLabel,
                alignment: Alignment.topRight,
                child: icon,
              )
            : icon,
      ),
    );
  }
}

// ─── Deprecated ───────────────────────────────────────────────────────────────

@Deprecated(
  'Use SPButtonIcon named constructors instead.\n'
  'Migration guide:\n'
  '  ButtonIconShape.square   → SPButtonIcon.square(path)\n'
  '  ButtonIconShape.circle   → SPButtonIcon.circle(path)\n'
  '  ButtonIconShape.outlined → SPButtonIcon.outlined(path, outlinedColor: ...)\n'
  '  ButtonIconShape.none     → SPButtonIcon(path)\n'
  '  filledColor: → color:\n'
  'Will be removed in a future version.',
)
enum ButtonIconShape { none, square, circle, outlined }
