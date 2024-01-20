import 'package:flutter/material.dart';

enum StateIcon {
  none,
  filled,
}

enum StateFormIcon {
  none,
  square,
  circle,
  outlined,
}

class SPButtonIcon extends StatelessWidget {
  final String iconData;
  final StateFormIcon? formState;
  final double? width;
  final double? height;
  final Color? filledColors;
  final Color? iconColor;
  final Color? outlinedColor;
  final bool? hasShadow;
  final double? radius;

  const SPButtonIcon({
    Key? key,
    this.formState,
    this.width,
    this.height,
    required this.iconData,
    this.filledColors,
    this.iconColor,
    this.outlinedColor,
    this.hasShadow = false,
    this.radius,
  })  : assert(formState != StateFormIcon.outlined || outlinedColor != null,
            'Invalid configuration: outlinedColor should be provided when formState is only outlined.'),
        assert(formState != StateFormIcon.square || hasShadow != null,
            'Invalid configuration: hasShadow should be provided when formState is only square.'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 70,
      height: height ?? 70,
      decoration: buildDecoration(formState ?? StateFormIcon.none),
      child: Icon(
        Icons.date_range,
        color: iconColor,
      ),
    );
  }

  BoxDecoration buildDecoration(StateFormIcon formState) {
    switch (formState) {
      case StateFormIcon.square:
        return BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 10.0),
          color: filledColors ?? const Color(0xFF3F97E3),
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
      case StateFormIcon.circle:
        return BoxDecoration(
          color: filledColors ?? const Color(0xFFE5F9FF),
          shape: BoxShape.circle,
        );
      case StateFormIcon.outlined:
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
