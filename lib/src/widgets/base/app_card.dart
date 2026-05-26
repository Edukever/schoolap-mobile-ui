part of '../widget.dart';

class SPCard extends StatelessWidget {
  const SPCard({
    super.key,
    required this.child,
    this.constraints = const BoxConstraints(maxWidth: double.infinity),
    this.backgroundColor,
    this.borderColor = const Color(0xFFE3E3E3),
    this.border,
    this.shadows,
    this.radius,
    this.onTap,
    this.margin,
    this.padding,
  });

  final Widget child;
  final BoxConstraints constraints;
  final Color? backgroundColor;
  final Color borderColor;
  final BoxBorder? border;
  final List<BoxShadow>? shadows;
  final Radius? radius;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  static const List<BoxShadow> _defaultShadow = [
    BoxShadow(
      color: Color(0x42CACFCE),
      blurRadius: 6.18,
      offset: Offset(0, 6.18),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        constraints: constraints,
        margin: margin,
        padding: padding,
        decoration: BoxDecoration(
          color: backgroundColor ?? theme.colors.white,
          borderRadius: BorderRadius.all(radius ?? theme.radius.medium),
          border: border ?? Border.all(width: 1, color: borderColor),
          boxShadow: shadows ?? _defaultShadow,
        ),
        child: child,
      ),
    );
  }
}
