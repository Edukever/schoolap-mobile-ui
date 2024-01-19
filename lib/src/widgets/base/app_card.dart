import 'package:flutter/material.dart';

class SchoolAppCard extends StatelessWidget {
  final Color backgroundColor;
  final List<BoxShadow>? shadows;
  final Widget child;

  const SchoolAppCard({
    Key? key,
    required this.child,
    this.backgroundColor = Colors.white,
    this.shadows,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
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
    );
  }
}
