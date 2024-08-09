part of '../widget.dart';

enum IconPosition {
  left,
  right,
}

enum DecorationState {
  none,
  solid,
  outline,
}

/// A primary button widget with customizable properties.
///
/// The button can have an optional icon, which can be positioned on the left or right side of the button's text.
/// If `hasIcon` is set to `true`, the icon will be displayed based on the `iconPosition` property.
/// If `hasIcon` is set to `false`, the `iconPosition` should be null.
class SPButtonPrimary<T> extends StatelessWidget {
  /// The background color of the button.
  final Color? backgroundColor;

  /// The outline border color of the button.
  final DecorationState? decorationState;

  /// The text displayed on the button.
  final String title;

  /// The height of the button.
  final double? height;

  /// The position of the icon relative to the button's text.
  final IconPosition? iconPosition;

  final Color? iconOrTextColor;

  /// The Width of the Button
  final double? width;

  final VoidCallback? onTap;

  /// The outline border color of the button.
  final Color? outlineBorderColor;

  /// The icon displayed on the button.
  final Widget? icon;

  /// The font weight of the button's text.
  final FontWeight? fontWeight;

  /// The font size of the button's text.
  final double? fontSize;

  final MainAxisAlignment? mainAxisAlignment;

  final double? radius;

  /// Creates a primary button widget.
  ///
  /// The [title] parameter is required.
  /// The [color] parameter can be used to customize the background color of the button.
  /// The [height] parameter can be used to set the height of the button.
  /// The [iconPosition] parameter can be used to specify the position of the icon.
  /// The [hasIcon] parameter determines whether the button has an icon or not.
  /// The [width] parameter can be used to set the width of the button.
  /// The [decorationState] parameter can be used to customize the button's appearance.
  /// The [iconOrTextColor] parameter can be used to customize the color of the icon or text.
  /// The [onTap] parameter can be used to handle button tap events.
  /// The [outlineBorderColor] parameter can be used to set the outline border color of the button.
  /// The [icon] parameter can be used to set the icon displayed on the button.
  const SPButtonPrimary({
    Key? key,
    this.backgroundColor,
    required this.title,
    this.height,
    this.iconPosition,
    this.width,
    this.decorationState,
    this.iconOrTextColor,
    this.onTap,
    this.outlineBorderColor,
    this.icon,
    this.fontWeight,
    this.fontSize,
    this.mainAxisAlignment,
    this.radius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: const Color(0xFFFFF2EC),
      onTap: onTap,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 50,
        decoration: buildBorderDecoration(decorationState ?? DecorationState.none),
        child: Center(
          child: icon != null
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
                  children: _buildButtonChildren(),
                )
              : SPText(
                  title,
                  color: iconOrTextColor ?? Colors.white,
                  fontSize: fontSize ?? 15.0,
                  fontWeight: fontWeight,
                ),
        ),
      ),
    );
  }

  BoxDecoration buildBorderDecoration(DecorationState decorationState) {
    switch (decorationState) {
      case DecorationState.solid:
        return BoxDecoration(
          color: backgroundColor ?? const Color(0xFFF68C2C),
          borderRadius: BorderRadius.circular(radius ?? 10.52),
        );
      case DecorationState.outline:
        return BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius ?? 10.52),
          border: Border.all(
            color: outlineBorderColor ?? const Color(0xFFF68C2C),
            width: 1.0,
          ),
        );
      default:
        return BoxDecoration(
          color: backgroundColor ?? const Color(0xFFF68C2C),
          borderRadius: BorderRadius.circular(radius ?? 10.52),
        );
    }
  }

  List<Widget> _buildButtonChildren() {
    final List<Widget> children = [];

    if (iconPosition == IconPosition.left) {
      children.add(
        icon ??
            Icon(
              Icons.arrow_forward,
              color: iconOrTextColor ?? Colors.white,
            ),
      );
    }

    children.add(
      SPText(
        title,
        color: iconOrTextColor ?? Colors.white,
        fontSize: fontSize ?? 14,
        fontWeight: fontWeight,
      ),
    );

    if (iconPosition == IconPosition.right) {
      children.add(
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: icon ??
              Icon(
                Icons.arrow_forward,
                color: iconOrTextColor ?? Colors.white,
              ),
        ),
      );
    }

    return children;
  }
}
