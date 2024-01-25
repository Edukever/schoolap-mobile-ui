part of '../widget.dart';

enum StateIcon {
  none,
  filled,
}

enum ButtonIconShape {
  none,
  square,
  circle,
  outlined,
}

class SPButtonIcon extends StatelessWidget {
  final String iconData;
  final ButtonIconShape? shape;
  final double? width;
  final double? height;
  final Color? filledColor;
  final Color? iconColor;
  final Color? outlinedColor;
  final bool? hasShadow;
  final double? radius;
  final double? iconSize;
  final bool showBadge;
  final Color? badgeColor;
  final Widget? badgeLabel;
  final Function()? onPressed;

  const SPButtonIcon({
    Key? key,
    required this.iconData,
    this.onPressed,
    this.shape,
    this.width,
    this.height,
    this.filledColor,
    this.iconColor,
    this.outlinedColor,
    this.hasShadow = false,
    this.radius,
    this.iconSize,
    this.showBadge = false,
    this.badgeLabel,
    this.badgeColor,
  })  : assert(
            shape != ButtonIconShape.outlined || outlinedColor != null, 'Invalid configuration: outlinedColor should be provided when shape is only outlined.'),
        assert(shape != ButtonIconShape.square || hasShadow != null, 'Invalid configuration: hasShadow should be provided when shape is only square.'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final icon = SvgPicture.asset(
      iconData,
      colorFilter: iconColor != null ? ColorFilter.mode(iconColor!, BlendMode.srcIn) : null,
      height: iconSize,
      width: iconSize,
    );

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width ?? 70,
        height: height ?? 70,
        decoration: buildDecoration(shape ?? ButtonIconShape.none),
        alignment: Alignment.center,
        child: showBadge
            ? Badge(
                isLabelVisible: true,
                backgroundColor: badgeColor ?? AppTheme.of(context).colors.bleu,
                label: badgeLabel,
                alignment: Alignment.topRight,
                child: icon,
              )
            : icon,
      ),
    );
  }

  BoxDecoration buildDecoration(ButtonIconShape formState) {
    switch (formState) {
      case ButtonIconShape.square:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10.0),
          color: filledColor ?? const Color(0xFF3F97E3),
          boxShadow: hasShadow == true
              ? const [
                  BoxShadow(
                    color: Color(0xDDB9D4D0),
                    blurRadius: 10.71,
                    offset: Offset(0, 4.29),
                    spreadRadius: 0,
                  )
                ]
              : null,
        );
      case ButtonIconShape.circle:
        return BoxDecoration(
          color: filledColor ?? const Color(0xFFE5F9FF),
          shape: BoxShape.circle,
        );
      case ButtonIconShape.outlined:
        return BoxDecoration(
          border: Border.all(
            color: outlinedColor ?? const Color(0xFFF68C2C),
          ),
          borderRadius: BorderRadius.circular(10.0),
        );
      default:
        return const BoxDecoration();
    }
  }
}
