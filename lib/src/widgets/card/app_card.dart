part of '../widget.dart';

class SPCard extends StatelessWidget {
  const SPCard({
    super.key,
    required this.child,
    this.constraints = const BoxConstraints(maxWidth: double.infinity),
    this.backgroundColor,
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

  /// Overrides the default 1 px `Color(0xFFE3E3E3)` border.
  final BoxBorder? border;

  /// Overrides the default drop shadow. Pass `[]` to remove shadows entirely.
  final List<BoxShadow>? shadows;

  final Radius? radius;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;

  static const _defaultBorder = Border.fromBorderSide(
    BorderSide(width: 1, color: Color(0xFFE3E3E3)),
  );

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

    final box = Container(
      constraints: constraints,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor ?? theme.colors.white,
        borderRadius: BorderRadius.all(radius ?? theme.radius.medium),
        border: border ?? _defaultBorder,
        boxShadow: shadows ?? _defaultShadow,
      ),
      child: child,
    );

    if (onTap == null) return box;
    return InkWell(onTap: onTap, child: box);
  }
}
