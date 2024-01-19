import 'package:flutter/material.dart';

class SchoolAppCard extends StatelessWidget {
  final BoxConstraints constraints;
  final Color borderColor;
  final Color backgroundColor;
  final List<BoxShadow>? shadows;
  final Widget child;
  final double radius;
  final VoidCallback? onTap;

  const SchoolAppCard({
    Key? key,
    required this.child,
    this.backgroundColor = Colors.white,
    this.shadows,
    required this.constraints,
    this.borderColor = const Color(0xFFE3E3E3),
    this.radius = 12,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: constraints,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            width: 1,
            color: borderColor,
          ),
          boxShadow: shadows ??
              const [
                BoxShadow(
                  color: Color(0x42CACFCE),
                  blurRadius: 6.18,
                  offset: Offset(0, 6.18),
                  spreadRadius: 0,
                )
              ],
        ),
        child: child,
      ),
    );
  }
}
