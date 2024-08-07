part of '../widget.dart';

class SPCard extends StatelessWidget {
  final BoxConstraints constraints;
  final Color borderColor;
  final Color? backgroundColor;
  final List<BoxShadow>? shadows;
  final Widget child;
  final Radius? radius;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  final BoxBorder? border;

  const SPCard({
    Key? key,
    required this.child,
    this.backgroundColor,
    this.shadows,
    required this.constraints,
    this.borderColor = const Color(0xFFE3E3E3),
    this.radius,
    this.onTap,
    this.margin,
    this.padding,
    this.border,
  }) : super(key: key);

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
          color: backgroundColor ?? theme.colors.blanc,
          borderRadius: BorderRadius.all(radius ?? theme.radius.regular),
          border: border ?? Border.all(
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
