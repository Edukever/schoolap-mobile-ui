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

class AppIconButton extends StatelessWidget {
  final List<Color>? colors;
  final String iconData;
  final StateFormIcon? formState;
  final double? width;
  final double? height;
  final Color? filledColors;
  final Color? iconColor;
  final Color? outlinedColor;
  final bool hasShadow;

  const AppIconButton({
    Key? key,
    this.formState,
    this.width,
    this.height,
    required this.iconData,
    this.colors,
    this.filledColors,
    this.iconColor,
    this.outlinedColor,
    this.hasShadow = false,
  })  : assert(formState != StateFormIcon.outlined || outlinedColor != null,
            'Invalid configuration: outlinedColor should be provided when formState is only outlined.'),
        assert(formState != StateFormIcon.square || hasShadow,
            'Invalid configuration: hasShadow should be true when formState is only square.'),
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
          gradient: LinearGradient(
            begin: const Alignment(-0.00, 1.00),
            end: const Alignment(0, -1),
            colors: colors ??
                const [
                  Color(0xFF3F97E3),
                  Color(0xFF43B4D6),
                ],
          ),
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
        return const BoxDecoration(
          color: Color(0xFFE5F9FF),
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
