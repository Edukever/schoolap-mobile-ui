import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:schoolap_pkg/src/widgets/base/app_text.dart';

enum IconPosition {
  left,
  right,
}

/// A primary button widget with customizable properties.
///
/// The button can have an optional icon, which can be positioned on the left or right side of the button's text.
/// If `hasIcon` is set to `true`, the icon will be displayed based on the `iconPosition` property.
/// If `hasIcon` is set to `false`, the `iconPosition` should be null.
class PrimaryButton<T> extends StatelessWidget {
  /// The background color of the button.
  final Color? backgroundColor;

  /// The text displayed on the button.
  final String title;

  /// The height of the button.
  final double? height;

  /// The position of the icon relative to the button's text.
  final IconPosition? iconPosition;

  /// Determines whether the button has an icon or not.
  final bool hasIcon;

  /// The Width of the Button
  final double? width;

  /// the color of the Text
  final Color? textColor;

  /// Creates a primary button widget.
  ///
  /// The [title] parameter is required.
  /// The [color] parameter can be used to customize the background color of the button.
  /// The [height] parameter can be used to set the height of the button.
  /// The [iconPosition] parameter can be used to specify the position of the icon.
  /// The [hasIcon] parameter determines whether the button has an icon or not.
  const PrimaryButton({
    Key? key,
    this.backgroundColor,
    required this.title,
    this.height,
    this.iconPosition,
    this.hasIcon = false,
    this.width,
    this.textColor,
  })  : assert(hasIcon || iconPosition == null,
            'Invalid configuration: iconPosition should be null when hasIcon is false.'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 50,
      decoration: BoxDecoration(
        color: backgroundColor ?? const Color(0xFFF68C2C),
        borderRadius: BorderRadius.circular(10.52),
      ),
      child: Center(
        child: hasIcon == true
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildButtonChildren(),
              )
            : AppText.title3(
                title,
                color: textColor ?? Colors.white,
              ),
      ),
    );
  }

  List<Widget> _buildButtonChildren() {
    final List<Widget> children = [];

    if (iconPosition == IconPosition.left) {
      children.add(
        const Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
      );
    }

    children.add(
      AppText.title2(
        title,
        color: Colors.white,
      ),
    );

    if (iconPosition == IconPosition.right) {
      children.add(
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ),
      );
    }

    return children;
  }
}
